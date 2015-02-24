#!/system/bin/sh
# This software is contributed or developed by KYOCERA Corporation.
# (C) 2012 KYOCERA Corporation
#

# No path is set up at this point so we have to do it here.
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

FIRMWARE_ORG=/system/etc/firmware.org
for dst in `ls ${FIRMWARE_ORG}`; do
	ln -s ${FIRMWARE_ORG}/${dst} /system/etc/firmware/${dst}
done

