#!/bin/sh

arch=`uname -m`
archver=`cat /proc/cpuinfo | grep architecture | sed -n '1p' | awk -F ':' '{printf $2}'`
if [ "$arch" == "mips" ];then
	tool=mitool_mipsle
else
	if [ $archver == 8 ];then
		tool=mitool_arm64
	else
		tool=mitool_arm
	fi
fi
if [ "$1" == "unlock" ];then
	/tmp/$tool unlock
elif [ "$1" == "hack" ];then
	/tmp/$tool hack
elif [ "$1" == "lock" ];then
	/tmp/$tool lock
elif [ "$1" == "password" ];then
	/tmp/$tool password
elif [ "$1" == "model" ];then
	/tmp/$tool model
elif [ "$1" == "sn" ];then
	/tmp/$tool sn
elif [ "$1" == "setsn" ];then
	/tmp/$tool setsn $2
else
	echo "what?"
fi
