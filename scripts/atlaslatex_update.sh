#! /bin/bash
# Script to update atlaslatex version from the Git master

# Copyright (C) 2002-2020 CERN for the benefit of the ATLAS collaboration

# Changes:
# 2018-08-14 Ian Brock (ian.brock@cern.ch): BASENAME should be set correctly if Makefile is overwritten.
# 2019-04-16 Ian Brock (ian.brock@cern.ch): Only overwrite "BASENAME = ..." and not occurences without a space (in help)
# 2020-11-21 Ian Brock (ian.brock@cern.ch): Check for use of \ATLASLATEXPATH and say atlaslatex_2002.sh should be run

# Decide how to clone atlaslatex - ssh is default
ATLASLATEXGIT=ssh://git@gitlab.cern.ch:7999/atlas-physics-office/atlaslatex.git
BRANCH=''
while getopts shkd opt; do
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
        d)
            BRANCH=devel
            ;;
        \?)
            echo "$0 [-h] [-k] [-s]"
            echo "  -h use https GitLab link"
            echo "  -k use krb5 GitLab link"
            echo "  -s use ssh GitLab link"
            echo "  -d use devel branch instead of master"
            exit 1
            ;;
    esac
done

# Check we are in the right directory
DIR=$(basename ${PWD})
if [ -e ${DIR}.tex ]; then
    echo "We are in directory ${PWD}"
else
    echo "We do not appear to be in the main directory: ${PWD}"
    echo "There should be a tex file with the same name as the directory"
    exit 1
fi

# Remove temporary directory if it exists
test -d tmp-atlaslatex && rm -r tmp-atlaslatex

# Clone the ATLAS LaTeX Git repository.
git clone ${ATLASLATEXGIT} tmp-atlaslatex
# Switch to devel branch for testing
if [ -n "${BRANCH}" ]; then
    cd tmp-atlaslatex 
    git checkout devel
    cd ..
fi

function cf_files {
    # echo "Compare ${afile} with ${lfile}"
    cmp --silent "$1" "$2"
    cmpStatus=$?
    # echo "cmp status is $cmpStatus" 
    if [ $cmpStatus -eq 0 ]; then
        echo "No change to file $1"
    else
        echo "Running diff on $1 vs $2"
        diff "$1" "$2"
        echo "Will try to copy $2 to $1"
        cp -i "$2" "$1"
    fi
}

# Self-update scripts first
for lfile in scripts/atlaslatex_update.sh scripts/atlaslatex_2020.sh; do
    afile=tmp-atlaslatex/scripts/$(basename $lfile)
    if [ -e ${lfile} ]; then
        cmp --silent ${lfile} ${afile}
        cmpStatus=$?
        if [ $cmpStatus -eq 0 ]; then
            echo "No change to file $1"
        else
            cf_files "${lfile}" "${afile}"
            echo "\n +++ ${lfile} updated. Rerun this script"
            exit 1
        fi
    else
        cp ${afile} ${lfile}
        echo "\n +++ ${lfile} updated. Rerun this script"
    fi
done

# Class and style files
for lfile in latex/*.cls latex/*.sty; do
    afile=tmp-atlaslatex/latex/$(basename $lfile)
    cf_files "${lfile}" "${afile}"
done

# atlaslatexpath.sty should be there
if [ -e latex/atlaslatexpath.sty ]; then
    lfile=latex/atlaslatexpath.sty
    afile=tmp-atlaslatex/latex/atlaslatexpath.sty
    cf_files "${lfile}" "${afile}"
else
    echo "Copying atlaslatexpath.sty to latex directory"
    cp tmp-atlaslatex/latex/atlaslatexpath.sty latex/
fi

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
# rm -rf tmp-atlaslatex

# 2020-11-21 ATLASLATEXPATH should no longer be used
mfile=${DIR}.tex
if [ $(grep -c ATLASLATEXPATH ${DIR}.tex) -gt 0 ]; then
    echo "*** IMPORTANT ***"
    echo "*** If you have not already done so, please run scripts/atlaslatex_2020.sh"
    echo "*** This adapts your main tex file to avoid problmes with TeX Live 2020"
    echo "*** It replaces the use of \ATLASLATEXPATH with a style file latex/atlaslatexpath.sty"
    echo "*** IMPORTANT ***"
fi