#!/bin/bash
#Author:galis
#Date:2015.12.15

startActivity=MainActivity
if [ ! -Z $1 ];then
startActivity=$1
fi
ionic build android
echo "===>start find "
packageName=`find ! -path "*build*" ! -path "*platforms*" -name "config.xml" | xargs grep "widget" |  awk -F "\"" '{print $2}'`
echo "===>find the packageName is :"$packageName
adb uninstall $packageName
echo "===>start install"
find . -name "*debug.apk" | xargs adb install 
echo "===>start app"
adb shell am start $packageName/.$startActivity


