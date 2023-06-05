#!/usr/bin/env bash
fileid=$1
#fileid="118ul9uLt-jebHAOMQNTogfbXsjJpXzTf"  #eg, 1AMQ1OndXcTxXwklOGJvK-A5uCGvHR4I7
filename=$2
#filename="zwx_debra.ckpt"
cd /workspace/runpod_ai/stable-diffusion-webui/models/Stable-diffusion/  #if downloading a checkpoint
#cd /workspace/stable-diffusion-webui/models/Lora  #if downloading a Lora
html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"`
#echo $html
curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename}


