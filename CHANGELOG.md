# Changelog

*Responsible:* Ian Brock (Ian.Brock@cern.ch)

Copyright (C) 2002-2020 CERN for the benefit of the ATLAS collaboration.

All notable changes to the ATLAS LaTeX package are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html)

Changes are sorted into the following categories:
Added, Changed, Deprecated, Removed, Fixed, Security.

## [10.0.0] - 2020-11-23

The October 2020 LaTeX update led to options being ignored when passed to a document class or a style file if the filename contained a directory.
While this bug will probably be fixed at some point,
it in general appears to be better to adjust the macro `\input@path`
to specify the directory that should be searched for the ATLAS LaTeX packages.
Hence a new style file `atlaslatexpath.sty` has been introduced and should be loaded using

```
\RequirePackage{latex/atlaslatexpath}
```

before the `\documentclass`.

### Added
- New style file `atlaslatexpath.sty` to set search path for style files and document class.
- New script `atlaslatex_2020.sh` to make adjustments to main files for TeX Live 2020.
### Changed
- Changed version numbering from 09-03-00 to 10.0.0 (follows Semantic Versioning).
- Templates and documentation switched to use of `atlaslatexpath.sty`.
- `atlaslatex_update.sh` script can self update and checks for use of `\ATLASLATEXPATH` macro.
### Deprecated
- The macro `\ATLASLATEXPATH` should no longer be necessary or be used.
### Removed
- Use of the `\ATLASLATEXPATH` macro in templates and documentation.
- Removed `texmf` targets in `Makefile`, as regular targets work in the same way.
### Fixed
- Block option was being ignored in `atlasbiblatex.sty` as of version 07-01-00.
- Remove a duplicate reference from ATAS-SUSY.bib.

## [09-03-00] - 2020-10-15
### Added
- August update of publications.
- Add JINST as a journal template.

## [09-01-00] - 2020-09-09
### Added
- June and July update of publications.
- Complete set of TDRs now included.
- Add usage of `\tablenum` for tables.
### Changed
- Changed citation ATLAS-TDR-2010-19 to ATLAS-TDR-19.
- A number of small updates to the default detector description from David Stoker.
### Fixed
- Use only `\AtlasTitle` macro and not `\title` macro when using `elsarticle` class.

## [09-00-03] - 2020-07-23
### Added
- Major additions to `ATLAS-useful.bib` from PMG group.
- Several generators added to `atlasmisc.sty`.
- Add `atlastodo.sty` for to-do notes.
- Add to-do notes package to templates.
- Add option `svgnames` to `xcolor`.
### Deprecated
- Move `atlasdoc2.cls` and `atlascover2.sty` to obsolete directory.
- Only TeX Live 2013 and later now supported.

## [08-05-00] - 2020-06-26
### Added
- April and May 2020 update of publications.

## [08-04-00] - 2020-05-17
### Added
- March 2020 update of publications including CMS backlog.
### Changed
- Updated acknowledgements citation.
- Number lines inside equations by default (`mathlines` option).
### Fixed
- Add fix for line numbering around AMS Math LaTeX environments.

## [08-03-00] - 2020-04-06
### Added
- December 2019 update of publications.
- Add bookmark package by default.

## [08-02-00] - 2020-03-15
### Added
- October and November updates of publications.
- Add `cleveref` package as a default package to `atlaspackage.sty`.
- Add `physics` package when passing option full to `atlaspackage.sty`.
- Add `unicode` and `psdextra` options for `hyperref`.
- New macro `\AtlasOrcid` for ORCID.
- ORCID can be included as an optional argument in `\AtlasAuthorContributor`.
- Links in authors will be black. This is used for ORCID links.

## [08-01-00] - 2019-11-26
### Added
- Add `atlaslogo` and `cernlogo` options to turn on/off showing the ATLAS and CERN logos.
### Changed
- Change default `percentspace` option in `atlaspackage.sty` to `false`.
- Updated acknowledgements.

## [08-00-00] - 2019-11-17
### Added
- August and September updates of publications + a few fixes.
- Add a first CI for ATLAS LaTeX.
- Updated acknowledgements.
### Changed
- Rename macro `\Ref` to `\Refn` and `\Refs` to `\Refns`, as `hyperref` defines `\Ref` in TeX Live 2019.
### Removed
- `\Ref` macro removed due to conflict with `hyperref` in TeX Live 2019.

## [07-05-01] - 2019-09-13
### Added
- Set default table of contents depth to section and add `tocdepth` option.
- July update of publications (except CMS).
- Add some, but not all, of the ATLAS TDRs to ATLAS.bib.
- Small updates to SUSY templates.
- Fix up a number of references in `ATLAS-useful.bib` and add a few new ones.
### Removed
- Remove usage of `tocloft` package, as it can conflict with KOMA-Script.

## [07-04-00] - 2019-05-21
### Changed
- Tweak the logic of the `backref` option. Now off by default, except for draft documents.

## [07-03-00] - 2019-05-09
### Added
- April update of publications.
### Changed
- Tweak `atlaslatex_update.sh` to not overwrite help text with `BASENAME`.
- A few fixes to references and detector description.

## [07-02-00] - 2019-03-19
### Added
- February update of publications.
- Run 2 detector description added.
- Update ATLAS-SUSY.bib and ATLAS-useful.bib.

## [07-01-01.] - 2019-02-28
### Changed
- Update ATLAS-SUSY.bib with correct Errata format and other fixes.

## [07-01-00] - 2019-02-22
### Added
- January update of publications.
- Add option `backref` to `atlasbiblatex`.
- Add commented out authorlist to paper template.
- Add INT note templates for SUSY group. These are a WIP and subject to further change.

## [07-00-00] - 2019-01-11
### Added
- November update of publications.
- Add `\JHEP` as a journal.
### Changed
- Rewrite macros for creating cover and title pages.
    - Copyright notice should now always be correctly positioned.
    - Less space used for title etc.
    - Tweaking of offsets should no longer be necessary.
    - Warnings about overfull hboxes fixed.
    - Previous version available as `atlasdoc2.cls` and `atlascover2.sty`.
- Always use paper=letter option for US paper size.
- Some tweaks so turning on language editor comments should not change text width.


## [06-00-00] - 2018-11-30
### Added
- October update of publications.
- Added a script `tex_dollars.py` to convert `$...$` to `\(...\)`.
### Changed
- Number and unit spacing in bib files changed to `~` instead of `\;`.
- Use `\text` instead of `\mbox`, `\textrm`, `\mathrm` in bib files.
- Use `\(...\)` instead of `$...$` in template and bib files.
- Use `firstinits` instead of `giveninits` as `biblatex` option for TeX Live < 2016 instead of 2015.
- Moved `atlaslatex_update.sh` script to scripts subdirectory.

## [Unreleased] - 2020-11-XX
## [0.0] - 2019-XX-YY
### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security

