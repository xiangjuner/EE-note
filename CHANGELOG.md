# Changelog

*Responsible:* Ian Brock (Ian.Brock@cern.ch)

Copyright (C) 2002-2020 CERN for the benefit of the ATLAS collaboration

All notable changes to the ATLAS LaTeX package are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html)

Changes are sorted into the following categories:
Added, Changed, Deprecated, Removed, Fixed, Security.

## [Unreleased] - 2020-10-XX
### Added
### Changed
- Changed version numbering from 09-04-00 to 9.4.0 (follows Semantic Versioning).
### Deprecated
### Removed
### Fixed
- Block option was being ignored in `atlasbiblatex.sty` as of version 07-01-00.
- Remove a duplicate reference from ATAS-SUSY.bib.
### Security

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
- `\Ref` macro removed due to conflict with hyperref in TeX Live 2019.

## [0.0] - 2019-XX-YY
### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security

