#!/usr/bin/env bash
link=$1
# Example Google Drive link: https://drive.google.com/file/d/118ul9uLt-jebHAOMQNTogfbXsjJpXzTf/view?usp=sharing
fileid=`echo $link | awk -F '/' '{ print $6 }'`
#fileid="118ul9uLt-jebHAOMQNTogfbXsjJpXzTf"  #eg, 1AMQ1OndXcTxXwklOGJvK-A5uCGvHR4I7
filename=$2
#filename="zwx_debra.ckpt"
destDir=$3
#eg: /workspace/runpod_ai/stable-diffusion-webui/models/Stable-diffusion if a checkpoint
#    /workspace/runpod_ai/stable-diffusion-webui/models/Lora if a Lora
cd $destDir
html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"`
curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename}
