#!/usr/bin/env bash
link=$1
filename=$2
destDir=$3

#echo Link = $1
#echo Filename = $2
#echo destination dir = $3

cd $destDir
srcDomain=`echo $link | awk -F '/' '{ print $3 }'`
#echo srcDomain = $srcDomain
if [ "$srcDomain" = "drive.google.com" ]; then
  #echo Downloading from Google Drive
  fileid=`echo $link | awk -F '/' '{ print $6 }'`
  #echo File ID = $fileid
  html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"`
  #echo html = $html
  #echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'
  curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename}
else
  curl $link -o $filename -L
fi
