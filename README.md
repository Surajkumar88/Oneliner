#  Oneliner

# ![logo](imgs/oneliner-logo.png)

<p align="center">
<a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
<a href="https://github.com/Surajkumar88/Oneliner/releases"><img src="https://img.shields.io/github/v/release/Surajkumar88/Oneliner"></a>
<a href="https://repology.org/metapackage/oneliner"><img src="https://repology.org/badge/tiny-repos/oneliner.svg" alt="Packaging status"></a>
<a href="https://tiswww.case.edu/php/chet/bash/bashtop.html"><img src="https://img.shields.io/badge/Bash-v4.4%5E-green?logo=GNU%20bash"></a>
<a href="https://github.com/Surajkumar88/Oneliner/actions/workflows/make_test.yml"><img src="https://github.com/Surajkumar88/Oneliner/actions/workflows/make_test.yml/badge.svg"></a>
<a href="https://github.com/Surajkumar88/Oneliner/actions/workflows/staging.yml"><img src="https://github.com/Surajkumar88/Oneliner/actions/workflows/staging.yml/badge.svg"></a>
</p>

<p align="center">
<a><img src="https://img.shields.io/badge/-OSX-grey?logo=apple"></a>
<a><img src="https://img.shields.io/badge/-Ubuntu-grey?logo=ubuntu"></a>
<a><img src="https://img.shields.io/badge/-Centos-grey?logo=centos"></a>
</p>

## Index

* [Documents](#documents)
* [Description](#description)
* [Features](#features)
* [Dependencies](#dependencies)
* [Installation](#installation)
* [Usage](#usage)
* [To-Do](#to-do)
* [License](#license)

## Documents

#### [CHANGELOG.md](CHANGELOG.md)

## Description

A command-line tool to convert multi-line bash script into a single-line command.

## Features

* Lightweight and simple to use in the command line.
* Output can be shown in CLI, copied to a clipboard, or saved to file📥.
* Formatting can be preserved in the output.

## Dependencies

#### OSX

Use **[bash](https://www.gnu.org/software/bash/)** (v4.4 or later), script functionality might break with earlier versions. 

**[GNU awk](https://www.gnu.org/software/gawk/)**

### *Support for other Linux Distros coming soon!!!*

## installation

#### Manual installation OSX

> Clone and install 

```bash
git clone https://github.com/Surajkumar88/Oneliner
cd Oneliner
make install
```
> To install in a custom directory
```
make DESTDIR=path/to/directory install
```

**NOTE**: You may have to run this as root.
> To uninstall

```bash
make uninstall
```
## Usage
```bash
git [-f | --file <file_path>] [-options <value>]
```
#### Options

    Options         Expected value      Description
    -f, --file      source path         path to the source file with the code to convert
    -o, --output    file path           save the output to file oneliner_out.txt in the given path (defaults to current working directory)
    -p, --print     on/off              verbose output in CLI
    -m, --multiline on/off              output/copy file contents with source formatting 
    -c, --copy      on/off              copy the output in clipboard 
    -h, --help                          display this help and exit
    -v, --version                       show version for Oneliner

## TODO

[Oneliner TODO](https://github.com/users/Surajkumar88/projects/2)

## License

[MIT License](LICENSE.md)
