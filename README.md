<img align="right" src="https://raw.githubusercontent.com/vroncevic/gen_pl_pro/dev/docs/gen_pl_pro_logo.png" width="25%">

# Generating Perl Project Structure

**gen_pl_pro** is shell tool for creating Perl project.

Developed in **[bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))** code: **100%**.

[![gen_pl_pro shell checker](https://github.com/vroncevic/gen_pl_pro/workflows/gen_pl_pro%20shell%20checker/badge.svg)](https://github.com/vroncevic/gen_pl_pro/actions?query=workflow%3A%22gen_pl_pro+shell+checker%22)

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

![Debian Linux OS](https://raw.githubusercontent.com/vroncevic/gen_pl_pro/dev/docs/debtux.png)

Navigate to release **[page](https://github.com/vroncevic/gen_pl_pro/releases)** download and extract release archive.

To install **gen_pl_pro** type the following

```
tar xvzf gen_pl_pro-x.y.tar.gz
cd gen_pl_pro-x.y
cp -R ~/sh_tool/bin/   /root/scripts/gen_pl_pro/ver.x.y/
cp -R ~/sh_tool/conf/  /root/scripts/gen_pl_pro/ver.x.y/
cp -R ~/sh_tool/log/   /root/scripts/gen_pl_pro/ver.x.y/
```

Self generated setup script and execution
```
./gen_pl_pro_setup.sh 

[setup] installing App/Tool/Script gen_pl_pro
	Sun 05 Dec 2021 11:03:27 AM CET
[setup] copy App/Tool/Script structure
[setup] remove github editor configuration files
[setup] set App/Tool/Script permission
[setup] create symbolic link of App/Tool/Script
[setup] done

/root/scripts/gen_pl_pro/ver.2.0/
├── bin/
│   ├── center.sh
│   ├── display_logo.sh
│   └── gen_pl_pro.sh
├── conf/
│   ├── gen_pl_pro.cfg
│   ├── gen_pl_pro.logo
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

4 directories, 14 files
lrwxrwxrwx 1 root root 50 Dec  5 11:03 /root/bin/gen_pl_pro -> /root/scripts/gen_pl_pro/ver.2.0/bin/gen_pl_pro.sh
```

Or You can use docker to create image/container.

[![gen_pl_pro docker checker](https://github.com/vroncevic/gen_pl_pro/workflows/gen_pl_pro%20docker%20checker/badge.svg)](https://github.com/vroncevic/gen_pl_pro/actions?query=workflow%3A%22gen_pl_pro+docker+checker%22)

### Usage

```
# Create symlink for shell tool
ln -s /root/scripts/gen_pl_pro/ver.x.y/bin/gen_pl_pro.sh /root/bin/gen_pl_pro

# Setting PATH
export PATH=${PATH}:/root/bin/

# Generating Perl project
gen_pl_pro RCP

gen_pl_pro ver.2.0
Sun 05 Dec 2021 11:07:45 AM CET

[check_root] Check permission for current session? [ok]
[check_root] Done

	                                              
	                          _                   
	  __ _  ___ _ __    _ __ | |  _ __  _ __ ___  
	 / _` |/ _ \ '_ \  | '_ \| | | '_ \| '__/ _ \ 
	| (_| |  __/ | | | | |_) | | | |_) | | | (_) |
	 \__, |\___|_| |_| | .__/|_| | .__/|_|  \___/ 
	 |___/             |_|       |_|              
	                                              
		Info   github.io/gen_pl_pro ver.2.0 
		Issue  github.io/issue
		Author vroncevic.github.io

[gen_pl_pro] Loading basic and util configuration!
100% [================================================]

[load_conf] Loading App/Tool/Script configuration!
[check_cfg] Checking configuration file [/root/scripts/gen_pl_pro/ver.2.0/conf/gen_pl_pro.cfg] [ok]
[check_cfg] Done

[load_conf] Done

[load_util_conf] Load module configuration!
[check_cfg] Checking configuration file [/root/scripts/gen_pl_pro/ver.2.0/conf/gen_pl_pro_util.cfg] [ok]
[check_cfg] Done

[load_util_conf] Done

[gen_pl_pro] Generating project structure!
[load_util_conf] Load module configuration!
[check_cfg] Checking configuration file [/root/scripts/gen_pl_pro/ver.2.0/conf/project_set.cfg] [ok]
[check_cfg] Done

[load_util_conf] Done

[gen_pl_pro] Generating directory [/data/dev/bash/3_tools/gen_pl_pro/RCP/]
[gen_pl_pro] Generating directory [/data/dev/bash/3_tools/gen_pl_pro/RCP/bin/]
[gen_pl_pro] Generating file [/data/dev/bash/3_tools/gen_pl_pro/RCP/bin/RCP.pl]!
[gen_pl_pro] Generating file [/data/dev/bash/3_tools/gen_pl_pro/RCP/bin/.editorconfig]
[gen_pl_pro] Generating directory [/data/dev/bash/3_tools/gen_pl_pro/RCP/conf/]
[gen_pl_pro] Generating file [/data/dev/bash/3_tools/gen_pl_pro/RCP/conf/.editorconfig]
[gen_pl_pro] Generating file [/data/dev/bash/3_tools/gen_pl_pro/RCP/conf/RCP.cfg]
[gen_pl_pro] Generating file [/data/dev/bash/3_tools/gen_pl_pro/RCP/conf/.editorconfig]
[gen_pl_pro] Generating file [/data/dev/bash/3_tools/gen_pl_pro/RCP/conf/RCP_util.cfg]
[gen_pl_pro] Generating directory [/data/dev/bash/3_tools/gen_pl_pro/RCP/log/]
[gen_pl_pro] Generating file [/data/dev/bash/3_tools/gen_pl_pro/RCP/log/RCP.log]
[gen_pl_pro] Generating file [/data/dev/bash/3_tools/gen_pl_pro/RCP/log/.editorconfig]
[gen_pl_pro] Set owner!
[gen_pl_pro] Set permission!
[logging] Checking directory [/root/scripts/gen_pl_pro/ver.2.0/log/]? [ok]
[logging] Write info log!
[logging] Done

[gen_pl_pro] Done

[check_tool] Checking tool [/usr/bin/tree]? [ok]
[check_tool] Done

/data/dev/bash/3_tools/gen_pl_pro/RCP/
├── bin
│   └── RCP.pl
├── conf
│   ├── RCP.cfg
│   └── RCP_util.cfg
└── log
    └── RCP.log

3 directories, 4 files
```

### Dependencies

**gen_pl_pro** requires next modules and libraries
* sh_util [https://github.com/vroncevic/sh_util](https://github.com/vroncevic/sh_util)

### Shell tool structure

**gen_pl_pro** is based on MOP.

Shell tool structure
```
sh_tool/
├── bin/
│   ├── center.sh
│   ├── display_logo.sh
│   └── gen_pl_pro.sh
├── conf/
│   ├── gen_pl_pro.cfg
│   ├── gen_pl_pro.logo
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

[![Documentation Status](https://readthedocs.org/projects/gen_pl_pro/badge/?version=latest)](https://gen_pl_pro.readthedocs.io/projects/gen_pl_pro/en/latest/?badge=latest)

More documentation and info at
* [https://gen_pl_pro.readthedocs.io/en/latest/](https://gen_pl_pro.readthedocs.io/en/latest/)
* [https://www.gnu.org/software/bash/manual/](https://www.gnu.org/software/bash/manual/)

### Copyright and licence

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2017 by [vroncevic.github.io/gen_pl_pro](https://vroncevic.github.io/gen_pl_pro)

**gen_pl_pro** is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

Lets help and support FSF.

[![Free Software Foundation](https://raw.githubusercontent.com/vroncevic/gen_pl_pro/dev/docs/fsf-logo_1.png)](https://my.fsf.org/)

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://my.fsf.org/donate/)
