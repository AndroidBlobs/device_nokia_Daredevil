#!/system/bin/sh
# Copyright (c) 2015, Longcheer. All rights reserved.
#

BOOT_FLAG=persist/bootflag.cfg
if [ ! -f "$BOOT_FLAG" ]; then
    touch $BOOT_FLAG
    chmod -h 664 $BOOT_FLAG
    chown -h system.root $BOOT_FLAG
fi

bootflag=`cat $BOOT_FLAG`
ffbmflag=`getprop ro.bootmode`

#The first,need to judge boot mode if the ffbm
if [ "$ffbmflag" == "ffbm-00" ]; then
    echo "" > $BOOT_FLAG
else
if [ "$bootflag" == "" ]; then
    echo "1" > $BOOT_FLAG
else
if [ "$bootflag" == "1" ]; then
    echo "0" > $BOOT_FLAG
fi
fi
fi
