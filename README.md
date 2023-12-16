<img align="right" src="https://raw.githubusercontent.com/vroncevic/gen_pl_pro/dev/docs/gen_pl_pro_logo.png" width="25%">

# Generating Perl Project Structure

**gen_pl_pro** is shell tool for creating Perl project.

Developed in **[bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))** code: **100%**.

[![gen_pl_pro_shell_checker](https://github.com/vroncevic/gen_pl_pro/actions/workflows/gen_pl_pro_shell_checker.yml/badge.svg)](https://github.com/vroncevic/gen_pl_pro/actions/workflows/gen_pl_pro_shell_checker.yml)

The README is used to introduce the tool and provide instructions on
how to install the tool, any machine dependencies it may have and any
other information that should be provided before the tool is installed.

[![GitHub issues open](https://img.shields.io/github/issues/vroncevic/gen_pl_pro.svg)](https://github.com/vroncevic/gen_pl_pro/issues) [![GitHub contributors](https://img.shields.io/github/contributors/vroncevic/gen_pl_pro.svg)](https://github.com/vroncevic/gen_pl_pro/graphs/contributors)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Shell tool structure](#shell-tool-structure)
- [Docs](#docs)
- [Copyright and licence](#copyright-and-licence)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Installation

Navigate to release **[page](https://github.com/vroncevic/gen_pl_pro/releases)** download and extract release archive.

To install **gen_pl_pro** type the following:

```
tar xvzf gen_pl_pro-x.y.tar.gz
cd gen_pl_pro-x.y
cp -R ~/sh_tool/bin/   /root/scripts/gen_pl_pro/ver.x.y/
cp -R ~/sh_tool/conf/  /root/scripts/gen_pl_pro/ver.x.y/
cp -R ~/sh_tool/log/   /root/scripts/gen_pl_pro/ver.x.y/
```

![alt tag](https://raw.githubusercontent.com/vroncevic/gen_pl_pro/dev/docs/setup_tree.png)

Or You can use docker to create image/container.

### Usage

```
# Create symlink for shell tool
ln -s /root/scripts/gen_pl_pro/ver.x.y/bin/gen_pl_pro.sh /root/bin/gen_pl_pro

# Setting PATH
export PATH=${PATH}:/root/bin/

# Generating Perl project
gen_pl_pro SimplePlTool
```

### Dependencies

**gen_pl_pro** requires next modules and libraries:
* sh_util [https://github.com/vroncevic/sh_util](https://github.com/vroncevic/sh_util)

### Shell tool structure

**gen_pl_pro** is based on MOP.

Code structure:
```
sh_tool/
├── bin/
│   └── gen_pl_pro.sh
├── conf/
│   ├── gen_pl_pro.cfg
│   ├── gen_pl_pro_util.cfg
│   ├── project_set.cfg
│   └── template/
│       ├── cfg_editorconfig.template
│       ├── log_editorconfig.template
│       ├── pl_editorconfig.template
│       ├── tool_config.template
│       ├── tool.template
│       └── tool_util_config.template
└── log/
    └── gen_pl_pro.log
```

### Docs

[![Documentation Status](https://readthedocs.org/projects/gen_pl_pro/badge/?version=latest)](https://gen-pl-pro.readthedocs.io/projects/gen_pl_pro/en/latest/?badge=latest)

More documentation and info at:
* [https://gen_pl_pro.readthedocs.io/en/latest/](https://gen-pl-pro.readthedocs.io/en/latest/)
* [https://www.gnu.org/software/bash/manual/](https://www.gnu.org/software/bash/manual/)

### Copyright and licence

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2017 - 2024 by [vroncevic.github.io/gen_pl_pro](https://vroncevic.github.io/gen_pl_pro)

**gen_pl_pro** is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

Lets help and support FSF.

[![Free Software Foundation](https://raw.githubusercontent.com/vroncevic/gen_pl_pro/dev/docs/fsf-logo_1.png)](https://my.fsf.org/)

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://my.fsf.org/donate/)
