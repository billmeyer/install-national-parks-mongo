Overview
========

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
