Overview
========

<<<<<<< HEAD
Every Chef installation needs a Chef Repository. This is the place where cookbooks, roles, config files and other artifacts for managing systems with Chef will live. We strongly recommend storing this repository in a version control system such as Git and treat it like source code.

While we prefer Git, and make this repository available via GitHub, you are welcome to download a tar or zip archive and use your favorite version control system to manage the code.

Repository Directories
======================

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

* `cookbooks/` - Cookbooks you download or create.
* `data_bags/` - Store data bags and items in .json in the repository.
* `roles/` - Store roles in .rb or .json in the repository.
* `environments/` - Store environments in .rb or .json in the repository.

Configuration
=============

The config file, `.chef/knife.rb` is a repository specific configuration file for knife. If you're using the Chef Platform, you can download one for your organization from the management console. If you're using the Open Source Chef Server, you can generate a new one with `knife configure`. For more information about configuring Knife, see the Knife documentation.

https://docs.chef.io/knife.html

Next Steps
==========

Read the README file in each of the subdirectories for more information about what goes in those directories.
=======
This Chef cookbook will install an instance of MongoDB 3.2 community edition and seed the install with data representing each of the US National Parks.  The recipe will install Mongo, enable it to auto start via `systemctl`, start it, and seed it with the sample data.

__NOTE__: The recipe will check any existing data in Mongo against a "known" checksum and if that checksum does not match the expected seed data checksum, the data in Mongo will be __DROPPED__ and replaced with the seed data.

Requirements
------------
- `Red Hat Enterprise Linux 7.0` or greater

Attributes
----------
None

Usage
-----

Run the cookbook in local mode using the provided `run-chef-client.sh` script.  The `cleanup.sh` script can be used to complete remove all traces, __INCLUDING DATA__, from the node.

License and Authors
-------------------
Authors: https://github.com/billmeyer
>>>>>>> 1330392af11e9b5462bf0307729634e399921536
