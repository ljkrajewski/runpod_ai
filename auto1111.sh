#!/usr/bin/env bash

function dlFromGoogle {
#because Google is a pain in the @$$.
#Downloads a file from Google drive to the current directory.
#Usage: dlFromGoogle 'http://drive.google.com/link/to/file' 'filename.ext'
  fileid=`echo $1 | awk -F '/' '{ print $6 }'`
  html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=$fileid"`
  curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo $html|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=$fileid" -o $2
}

cd /workspace
#git lfs install
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

## Models ##
cd /workspace/stable-diffusion-webui/models/Stable-diffusion
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors
curl https://civitai.com/api/download/models/51913 -o edgeOfRealism.safetensors -L

## VAE ##
cd /workspace/stable-diffusion-webui/models/VAE
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors

## Embeddings ##
#cd /workspace/stable-diffusion-webui/embeddings
#git clone https://huggingface.co/nolanaatama/embeddings

## Extentions ##
cd /workspace/stable-diffusion-webui/extensions
# Kohya-ss/Additional Networks models (https://github.com/kohya-ss/sd-webui-additional-networks.git)
git clone https://github.com/kohya-ss/sd-webui-additional-networks.git
# Booru Tag Autocomplete
git clone https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git
# Image browser
git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser.git
# Aspect Ratio Helper
git clone https://github.com/thomasasfk/sd-webui-aspect-ratio-helper.git
# System Info
git clone https://github.com/vladmandic/sd-extension-system-info.git
# ControlNet for Stable Diffusion WebUI (https://github.com/Mikubill/sd-webui-controlnet)
git clone https://github.com/Mikubill/sd-webui-controlnet.git
cd sd-webui-controlnet/models
git clone https://huggingface.co/lllyasviel/ControlNet-v1-1

## Start the GUI ##
cd /workspace/stable-diffusion-webui/
cp /workspace/runpod_ai/settings/config.json .
cp /workspace/runpod_ai/emb.txt extensions/a1111-sd-webui-tagcomplete/tags/temp
cmdlineArgs="--xformers --enable-insecure-extension-access --disable-safe-unpickle"
sed -i 's/#export COMMANDLINE_ARGS=""/export COMMANDLINE_ARGS="--share $cmdlineArgs"/' webui-user.sh
./webui.sh -f
