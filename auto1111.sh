#!/usr/bin/env bash

function dlFromGoogle {
#because Google is a pain in the @$$.
#Usage: dlFromGoogle 'http://drive.google.com/link/to/file' 'filename.ext' '/dest/ina/tion/directory'
  link=$1
  filename=$2
  destDir=$3
  #echo Downloading from Google Drive
  fileid=`echo $link | awk -F '/' '{ print $6 }'`
  #echo File ID = $fileid
  html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"`
  #echo html = $html
  #echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'
  curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename}
}

cd /workspace
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

## Models ##
cd /workspace/stable-diffusion-webui/models/Stable-diffusion
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors
wget https://civitai.com/api/download/models/51913 && mv 51913 edgeOfRealism.safetensors

## Extentions ##
cd /workspace/stable-diffusion-webui/extensions
# Kohya-ss/Additional Networks models (https://github.com/kohya-ss/sd-webui-additional-networks.git)
git clone https://github.com/kohya-ss/sd-webui-additional-networks.git
# ControlNet for Stable Diffusion WebUI (https://github.com/Mikubill/sd-webui-controlnet)
git clone https://github.com/Mikubill/sd-webui-controlnet.git
cd sd-webui-controlnet/models
git lfs install
git clone https://huggingface.co/lllyasviel/ControlNet-v1-1

## Start the GUI ##
cd /workspace/stable-diffusion-webui/
cmdlineArgs="--xformers --enable-insecure-extension-access"
sed -i 's/#export COMMANDLINE_ARGS=""/export COMMANDLINE_ARGS="--share $cmdlineArgs"/' webui-user.sh
./webui.sh -f
