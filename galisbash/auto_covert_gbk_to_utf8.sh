#!/bin/bash
#Usage:
#I want to change the gbk project to utf8.
#Author:galis
#Date:2015.12.04 11:57

#Check the input

if [ -z $1 ] ;then
echo "Please input the project you want to convert!!"
exit 1
fi

if [ ! -d $1 ] ;then
echo "Which you input is not a directory!!"
exit 1
fi


#Search and convert the files 
find $1 -name "*.java" -o -name "*.xml" -o -name "*.txt" | xargs -ti  sh -c " mv {} {}.bak ; iconv -f gbk -t utf-8 {}.bak > {} ; rm {}.bak"
