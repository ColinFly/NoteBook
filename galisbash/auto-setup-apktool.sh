#!/bin/bash
#Audo setup the environment of apktool
#Author:galis
#Date:2015.11.04 10:00

apktool=apktool
apktooljar=apktool.jar

if [ ! -f $apktool ];then
wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O $apktool
fi

if [ ! -f $apktooljar ];then
wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.0.2.jar -O $apktooljar
fi

chmod a+x $apktool $apktooljar
sudo mv $apktool $apktooljar /usr/local/bin

