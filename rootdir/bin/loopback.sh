#! /system/bin/sh
echo "loopback test"
spk=1
rec=2
mic1=3
mic2=4
playback=5
enable=1
disable=0
open="-Y"
close="-N"
pname="tinyhostless"
pbname="loopbacktest"

if test $2 -eq $enable
then
	loopbacktest $open "$1" 13
	if test $1 -eq $playback
	then
		echo "playback test!"
	else
		if test $1 -eq $spk
		then
		#setprop sys.tinyhostless-spk 1
		setenforce 0
		start tinyhostless_spk
		else
		#setprop sys.tinyhostless 1
		setenforce 0
		start tinyhostless
		fi	
	fi
elif test $2 -eq $disable
then
	if test $1 -eq $playback
	then
	pkill -f $pbname
	setprop odm.spk-playback 2
	loopbacktest $close "$1"
	else
	pkill -f $pname
	loopbacktest $close "$1"
	#setprop odm.tinyhostless 0
	#setprop odm.tinyhostless-spk 0
	stop tinyhostless
	stop tinyhostless_spk
	setprop odm.loopback-spk 2
	setprop odm.loopback-rec 2
	setprop odm.loopback-mic1 2
	setprop odm.loopback-mic2 2
	fi
else
	echo "input error ctl cmd!"
fi
