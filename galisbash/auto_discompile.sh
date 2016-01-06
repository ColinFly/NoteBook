#!/bin/bash
#Author:galis
#Date:2015.12.03 20:58

if [ -z $1 ];then
echo "Please input the apk which you want to discompile!!"
exit 1
fi

apkName=$1
apkName=${apkName%.apk}
TOOLS_DIR=/opt/disCompileApk
outDir=output
if [ ! -d $outDir ];then
mkdir $outDir
fi

if [ -d $outDir/$apkName ];then
rm -R $outDir/$apkName
fi
mkdir $outDir/$apkName

cp $1 $outDir/$apkName
cd $outDir/$apkName

ll
unzip $1

find -name classes.dex | xargs -i sh $TOOLS_DIR/dex-tools/d2j-dex2jar.sh {} 
find -name classes-dex2jar.jar | xargs -i mv {} $apkName.jar

apktool d $1
#Create android project
android create project -a $apkName -k com.$apkName -t 8 -p android_$apkName -g -v 1.5.0+
cp -r $apkName/AndroidManifest.xml $apkName/res android_$apkName/src/main
mkdir android_$apkName/src/main/libs
cp $apkName.jar android_$apkName/src/main/libs


java -jar $TOOLS_DIR/jd-gui.jar $apkName.jar


