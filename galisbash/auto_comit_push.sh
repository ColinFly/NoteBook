#!/bin/bash
#Author:galis
#Date:2015.12.17

if [ -z $1 ];then
echo "please input the version"
exit 1
fi

cp /opt/yimei/svnrepo/yimeiwificontrol/app/build/outputs/apk/app-debug.apk yimei_wifi_$1.apk
echo "version=$1" > yimei_wifi_config.properties
git add *
git commit -m "auto_commit all"
git push
