# Generating Perl Project Structure.

gen_pl_pro is shell tool for Perl project.

Developed in bash code: 100%.

The README is used to introduce the tool and provide instructions on
how to install the tool, any machine dependencies it may have and any
other information that should be provided before the tool is installed.

[![GitHub issues open](https://img.shields.io/github/issues/vroncevic/gen_pl_pro.svg)](https://github.com/vroncevic/gen_pl_pro/issues)
 [![GitHub contributors](https://img.shields.io/github/contributors/vroncevic/gen_pl_pro.svg)](https://github.com/vroncevic/gen_pl_pro/graphs/contributors)

### INSTALLATION

Navigate to release [page](https://github.com/vroncevic/gen_pl_pro/releases) download and extract release archive.

To install modules type the following:

```
tar xvzf gen_pl_pro-x.y.z.tar.gz
cd gen_pl_pro-x.y.z
cp -R ~/sh_tool/bin/   /root/scripts/gen_pl_pro/ver.1.0/
cp -R ~/sh_tool/conf/  /root/scripts/gen_pl_pro/ver.1.0/
cp -R ~/sh_tool/log/   /root/scripts/gen_pl_pro/ver.1.0/
```

Or You can use docker to create image/container.

:sparkles:

### USAGE

```
# Create symlink for shell tool
ln -s /root/scripts/gen_pl_pro/ver.1.0/bin/gen_pl_pro.sh /root/bin/gen_pl_pro

# Setting PATH
export PATH=${PATH}:/root/bin/

# Generating Perl project
gen_pl_pro SimplePlTool
```

### DEPENDENCIES

This tool requires these other modules and libraries:

* sh_util https://github.com/vroncevic/sh_util

### SHELL TOOL STRUCTURE

gen_pl_pro is based on MOP.

Shell tool structure:
```
.
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

### DOCS

[![Documentation Status](https://readthedocs.org/projects/gen_pl_pro/badge/?version=latest)](https://gen_pl_pro.readthedocs.io/projects/gen_pl_pro/en/latest/?badge=latest)

More documentation and info at:

* https://gen_pl_pro.readthedocs.io/en/latest/

:sparkles:

### COPYRIGHT AND LICENCE

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2018 by https://vroncevic.github.io/gen_pl_pro

This tool is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

:sparkles:

