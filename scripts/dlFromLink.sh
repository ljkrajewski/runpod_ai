#!/usr/bin/env bash
link=$1
filename=$2
destDir=$3

cd $destDir
srcDomain=`echo $link | awk -F '/' '{ print $3 }'`
if [ "$scrDomain" = "drive.google.com" ]; then
  fileid=`echo $link | awk -F '/' '{ print $6 }'`
  html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"`
  curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename}
else
  curl $link -o $filename -L
fi
