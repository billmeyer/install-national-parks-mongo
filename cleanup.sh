#!/bin/bash

echo "Stopping mongod"
systemctl stop mongod 2> /dev/null

echo "Disabling mongod"
systemctl disable mongod 2> /dev/null

yum -y erase mongodb-org mongodb-org-tools mongodb-org-server mongodb-org-mongos mongodb-org-shell

rm -fv /etc/yum.repos.d/mongodb.repo
rm -fv /lib/systemd/system/mongod.service
rm -fv /tmp/national_park_service.json
rm -fv /tmp/check-nationalparks-data.sh

# remove mongo database files
rm -rfv /var/lib/mongo

echo "done."
