<!--
SPDX-FileCopyrightText: 2021 Rosa Richter

SPDX-License-Identifier: MIT
-->

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2021-09-09

### Added

- `--format` option (`-f`) to the `ls` subcommand.
  You can now export the data as `csv` and `json`.
  These output formats include all the fields returned by the SPDX API,
  not just the ID and name.
  The existing format is now called the `text` format and is default.

## [1.1.0] - 2021-09-08

### Added

- New `ls` subcommand to list all licenses in the list

### Changed

- Errors are now printed to stderr and returns a non-zero error code when something bad happens

## [1.0.0] - 2021-09-08

### Added

- Downloading of license by SPDX ID.

[Unreleased]: https://git.sr.ht/~cosmicrose/spdx_cli/log
[1.2.0]: https://git.sr.ht/~cosmicrose/spdx_cli/refs/v1.2.0
[1.1.0]: https://git.sr.ht/~cosmicrose/spdx_cli/refs/v1.1.0
[1.0.0]: https://git.sr.ht/~cosmicrose/spdx_cli/refs/v1.0.0
