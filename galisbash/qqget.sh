#!/bin/bash
#Author:galis
#Date:2015.12.12
qqfile=/sdcard/tencent/QQfile_recv
if [ -z $1 ];then
echo "Please input the file name which you want to get!!"
echo "Such as 'qqget filename dir'"
exit 1
fi
if [ -z $2 ];then
echo "Please input the dir name which you want to put the file in!!"
echo "Such as 'qqget filename dir'"
exit 1
fi
adb pull $qqfile/$1 $2



