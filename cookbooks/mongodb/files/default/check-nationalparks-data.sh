#!/bin/bash

CHKSUM=`mongo demo --eval "db.nationalparks.find().forEach(printjson)" | md5sum | awk '{print $1}'`
VALUE=c627c40d435f0b9f90480479e3a7fa6c

echo "Computed chksum: ${CHKSUM}"
echo "Expected chksum: ${VALUE}"

touch /tmp/${CHKSUM} 2> /dev/null
[ "${CHKSUM}" == "${VALUE}" ];
