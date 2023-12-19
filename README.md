# ATLAS LaTeX

ATLAS LaTeX class, style files and templates to typeset notes and papers.
See CHANGELOG.md or Git log for history of changes.

*Responsible:* Ian Brock (Ian.Brock@cern.ch)

Copyright (C) 2002-2023 CERN for the benefit of the ATLAS collaboration

------

## How to use

The general idea is that, for each document, this package should be cloned into a new directory.
It is assumed that all style files are in a directory `latex`,
which is a subdirectory of the one in which the main document sits.
The `latex` subdirectory can of course be a link to a central style directory.

The directory search path (`TEXINPUTS`) is supplemented by the `latex` directory in `atlaslatexpath.sty`.
This replaced the use of `\ATLASSLATEXPATH` in Version 10.0.

To make a new paper/CONF note/PUB note draft give the command:

    make newpaper [BASENAME=mydocument]

To make a new ATLAS note give the command:

    make newnote [BASENAME=mydocument]

`make new` is an alias for `make newpaper`.

Subsequently, you will have to specify which note to build like

    make [BASENAME=mydocument]

using the same name you generated previously.

I strongly recommend that you use `latexmk` to compile your document (this is also the default).
It works out for itself what has to be run and generally works very well.
In order to use `pdflatex` directly, change the default target in the `Makefile` from `run_latexmk` to `run_pdflatex`.

The class and style files should find out for themselves which version of TeX Live you are running
and adjust things as necessary.
TeX Live versions older than 2013 are not supported.
The command `make help` gives you a bit more assistance on which make targets exist.

To add the cover pages for a paper/CONF note/PUB note when circulating it
to the ATLAS collaboration, add the option `coverpage` to the `\documentclass`.

If you want to use the templates for documents that are stored in CERN GitLab,
but are not inside PO-GitLab and hence should not make use of the PO-GitLab CI tools,
you should delete the file: `.gitlab-ci.yml`.
For PO-GitLab documents, the Git repository is in a subdirectory of: https://gitlab.cern.ch/groups/atlas-physics-office/subgroups.

### Running on lxplus

The most common FAQ I get is why `atlaslatex` does not just compile "out of the box"?
If you are running on `lxplus` for it to work, you MUST set your PATH correctly as follows:

    export PATH=/cvmfs/sft.cern.ch/lcg/external/texlive/2020/bin/x86_64-linux:$PATH

in order to use TeX Live 2020.
Physics Office Continuous Integration has images for TeX Live 2017 and 2020.

### Makefile and documentation

You can produce the users guide to the templates (and thus test that your LaTeX setup is working)
by giving the commands:

    cd doc/atlas_latex
    make

Three other make targets are:

- `make clean`: cleans up intermediate files
- `make cleanpdf`: remove output pdf file
- `make cleanall`: also cleans up output pdf file

## Running with different `TeX Live` versions

- Skeleton documents work without change for TeX Live 2015 and later.
  You have to pass the `firstinits` option to `atlaspackage` for older versions.
- The documentation needs small tweaks to compile with versions older than 2018.
- The journal skeleton `atlass-revtex.tex` needs to use `revtex4-1`
  instead of `revtex4-2` for versions older than 2018.
- Do not try to use `diffcoeff` for TeX Live 2016.

## Included files

The following template main files exist:

- `atlas-paper.tex`:    ATLAS paper draft (including CONF and PUB notes)
- `atlas-note.tex`:     ATLAS note
- `atlas-book.tex`:     Long ATLAS document,  such as a TDR
- `atlas-draft-cover.tex`:  Make a standalone cover for an ATLAS draft
- `atlas-preprint-cover.tex`: Make a standalone cover for an ATLAS CERN preprint
- `atlas-auxmat-main.tex`:  A front page for auxiliary material
- `atlas-hepdata-main.tex`: A front page for material destined for HEPData
  
The ATLAS document class (`atlasdoc.cls`) and style files can be found in 
the latex directory. The following main style files exist:

- `atlasbiblatex.sty`:  Reference style adjustments for `biblatex`
- `atlascover.sty`:     Make a cover (CONF note, CERN preprint, ATLAS draft)
- `atlascontribute.sty`: List of contributors (and authors) for a document
- `atlaspackage.sty`:   Standard packages used in ATLAS documents
- `atlasphysics.sty`:   Useful definitions. This file simply inputs others.

Options can be used to specify which should be included.

Documentation can be found via the ATLAS TWiki page:
<https://twiki.cern.ch/twiki/bin/view/AtlasProtected/PubComLaTeX>

The following documents are available in subdirectories of the `doc` and `template` directories or as artifacts in the GitLab repository:
* [Users guide to the ATLAS LaTeX package](https://gitlab.cern.ch/atlas-physics-office/atlaslatex/-/jobs/artifacts/master/file/doc/atlas_latex/atlas_latex.pdf?job=build_user) - also in `doc/atlas_latex`
* [Guide to references and BibTeX in ATLAS documents](https://gitlab.cern.ch/atlas-physics-office/atlaslatex/-/jobs/artifacts/master/file/doc/atlas_bibtex/atlas_bibtex.pdf?job=build_bibtex) - also in `doc/atlas_bibtex`
* [ATLAS physics symbols](https://gitlab.cern.ch/atlas-physics-office/atlaslatex/-/jobs/artifacts/master/file/doc/atlas_physics/atlas_physics.pdf?job=build_physics) - also in `doc/atlas_physics`
* [ATLAS physics symbols with hepparticle](https://gitlab.cern.ch/atlas-physics-office/atlaslatex/-/jobs/artifacts/master/file/doc/atlas_physics/atlas_hepphysics.pdf?job=build_physics) - also in `doc/atlas_physics`
* [Guide to formatting tables for ATLAS documents](https://gitlab.cern.ch/atlas-physics-office/atlaslatex/-/jobs/artifacts/master/file/doc/atlas_tables/atlas_tables.pdf?job=build_tables) - also in `doc/atlas_tables`

