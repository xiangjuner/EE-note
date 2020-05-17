#! /bin/bash
# Script to update atlaslatex version from the Git master

# Copyright (C) 2002-2020 CERN for the benefit of the ATLAS collaboration

# Changes:
# 2018-08-14: BASENAME should be set correctly if Makefile is overwritten.
# 2019-04-16: Only overwrite "BASENAME = ..." and not occurences without a space (in help)

# Remove temporary directory if it exists
test -d tmp-atlaslatex && rm -r tmp-atlaslatex

# Decide how to clone atlaslatex - ssh is default
ATLASLATEXGIT=ssh://git@gitlab.cern.ch:7999/atlas-physics-office/atlaslatex.git
while getopts shk opt; do
    case $opt in
        s)
            ATLASLATEXGIT=ssh://git@gitlab.cern.ch:7999/atlas-physics-office/atlaslatex.git
            ;;
        h)
            ATLASLATEXGIT=https://gitlab.cern.ch/atlas-physics-office/atlaslatex.git
            ;;
        k)
            ATLASLATEXGIT=https://:@gitlab.cern.ch:8443/atlas-physics-office/atlaslatex.git
            ;;
        \?)
            echo "$0 [-h] [-k] [-s]"
            echo "  -h use https GitLab link"
            echo "  -k use krb5 GitLab link"
            echo "  -s use ssh GitLab link"
            exit 1
            ;;
    esac
done

git clone ${ATLASLATEXGIT} tmp-atlaslatex

function cf_files {
    # echo "Compare ${afile} with ${lfile}"
    cmp --silent "$1" "$2"
    cmpStatus=$?
    # echo "cmp status is $cmpStatus" 
    if [ $cmpStatus -eq 0 ]; then
        echo "No change to file $1"
    else
        echo "Running diff on $2 vs $1"
        diff "$2" "$1"
        echo "Will try to copy $2 to $1"
        cp -i "$2" "$1"
    fi
}

# Class and style files
for lfile in latex/*.cls latex/*.sty; do
    afile=tmp-atlaslatex/latex/$(basename $lfile)
    cf_files "${lfile}" "${afile}"
done

# Bibliography files
for lfile in bib/*.bib; do
    afile=tmp-atlaslatex/bib/$(basename $lfile)
    cf_files "${lfile}" "${afile}"
done

# Logos
for lfile in logos/*; do
    afile=tmp-atlaslatex/logos/$(basename $lfile)
    cf_files "${lfile}" "${afile}"
done

# Makefile
for lfile in Makefile; do
    BASENAME=$(grep '^BASENAME.*=' ${lfile})
    echo "BASENAME is $BASENAME"
    afile=tmp-atlaslatex/$(basename $lfile)
    cf_files "${lfile}" "${afile}"
    # Assume definition of BASENAME is of the form BASENAME =
    sed -i '.bak' -e "s/BASENAME[ \t]+=.*/${BASENAME}/" ${lfile}
    # The folllowing should only change the first occurence of BASENAME =..., but has not been tested everywhere
    # sed -i '.bak' -e "0,/${BASENAME}/ s/BASENAME[ \t]+=.*/${BASENAME}/" ${lfile}
done

# Acknowledgements
for lfile in acknowledgements/*.tex acknowledgements/*.bib; do
    afile=tmp-atlaslatex/acknowledgements/$(basename $lfile)
    cf_files "${lfile}" "${afile}"
done

# Remove temporary directory
rm -rf tmp-atlaslatex
