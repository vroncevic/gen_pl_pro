GEN_PL_PRO
-----------

.. toctree::
 :hidden:

 self


gen_pl_pro is shell tool for creating Perl project.

Developed in bash code: 100%.

The README is used to introduce the tool and provide instructions on
how to install the tool, any machine dependencies it may have and any
other information that should be provided before the tool is installed.

|GitHub issues| |Documentation Status| |GitHub contributors|

.. |GitHub issues| image:: https://img.shields.io/github/issues/vroncevic/gen_pl_pro.svg
   :target: https://github.com/vroncevic/gen_pl_pro/issues

.. |GitHub contributors| image:: https://img.shields.io/github/contributors/vroncevic/gen_pl_pro.svg
   :target: https://github.com/vroncevic/gen_pl_pro/graphs/contributors

.. |Documentation Status| image:: https://readthedocs.org/projects/gen_pl_pro/badge/?version=latest
   :target: https://gen_pl_pro.readthedocs.io/projects/gen_pl_pro/en/latest/?badge=latest

INSTALLATION
-------------
Navigate to release `page`_ download and extract release archive.

.. _page: https://github.com/vroncevic/gen_pl_pro/releases

To install this set of modules type the following:

.. code-block:: bash

   tar xvzf gen_pl_pro-x.y.z.tar.gz
   cd gen_pl_pro-x.y.z
   cp -R ~/sh_tool/bin/   /root/scripts/gen_pl_pro/ver.1.0/
   cp -R ~/sh_tool/conf/  /root/scripts/gen_pl_pro/ver.1.0/
   cp -R ~/sh_tool/log/   /root/scripts/gen_pl_pro/ver.1.0/

DEPENDENCIES
-------------
This tool requires these other modules and libraries:

.. code-block:: bash

   sh_util https://github.com/vroncevic/sh_util

SHELL TOOL STRUCTURE
---------------------
gen_pl_pro is based on MOP.

Shell tool structure:

.. code-block:: bash

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

COPYRIGHT AND LICENCE
----------------------

|License: GPL v3| |License: Apache 2.0|

.. |License: GPL v3| image:: https://img.shields.io/badge/License-GPLv3-blue.svg
   :target: https://www.gnu.org/licenses/gpl-3.0

.. |License: Apache 2.0| image:: https://img.shields.io/badge/License-Apache%202.0-blue.svg
   :target: https://opensource.org/licenses/Apache-2.0

Copyright (C) 2018 by https://vroncevic.github.io/gen_pl_pro

This tool is free software; you can redistribute it and/or modify it
under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

