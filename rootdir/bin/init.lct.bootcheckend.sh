#!/system/bin/sh
# Copyright (c) 2015, Longcheer. All rights reserved.
#
BOOT_FLAG=persist/bootflag.cfg
#get boot flag from file("persist/bootflag.cfg")
bootflag=`cat $BOOT_FLAG`
first_boot=`getprop persist.sys.first_boot`
#get encrypt  property
cryptflag=`getprop vold.decrypt`

if [ "$first_boot" == "" ]; then
if [ "$bootflag" == "1" ]; then
    setprop persist.sys.first_boot complete
    LctReadWriteNV 7243 1
fi
if [ "$bootflag" == "0" ]; then
    setprop persist.sys.first_boot interrupt
    LctReadWriteNV 7243 0
fi
else
if [ "$first_boot" == "interrupt" ]; then
    setprop persist.sys.first_boot interrupt
    LctReadWriteNV 7243 0
fi
fi

#if decrypt/encrypt fail,then boot has been interrupt,
#it must be set "0" to $BOOT_FLAG
if [ "$cryptflag" == "trigger_restart_min_framework" ]; then
    echo "0" > $BOOT_FLAG
else
    echo "" > $BOOT_FLAG
fi
