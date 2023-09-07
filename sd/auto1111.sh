#!/usr/bin/env bash
fuser -k 7860/tcp

BASE='/workspace'
SDBASE="$BASE/stable-diffusion-webui"
RPBASE="$BASE/runpod_ai/sd"

cd $BASE
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

cd $SDBASE
python -m venv venv
cd venv
source bin/activate

MODELS_DIR="$SDBASE/models/Stable-diffusion"
VAE_DIR="$SDBASE/models/VAE"
LORA_DIR="$SDBASE/models/Lora"
EMBEDDING_DIR="$SDBASE/embeddings"
UPSCALERS_DIR="$SDBASE/models/ESRGAN"
source $RPBASE/sd-config-models.sh

## Extentions ##
cd $SDBASE/extensions
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
# Stable Diffusion Dynamic Prompts
git clone https://github.com/adieyal/sd-dynamic-prompts.git
# ControlNet for Stable Diffusion WebUI (https://github.com/Mikubill/sd-webui-controlnet)
git clone https://github.com/Mikubill/sd-webui-controlnet.git
cd sd-webui-controlnet/models
git clone https://huggingface.co/lllyasviel/ControlNet-v1-1

## Start the GUI ##
cd $SDBASE
cp /workspace/runpod_ai/settings/config.json .
cp /workspace/runpod_ai/emb.txt extensions/a1111-sd-webui-tagcomplete/tags/temp
#cmdlineArgs="--share --xformers --enable-insecure-extension-access --disable-safe-unpickle"
cmdLineArgs="--listen --port 7860 --xformers --enable-insecure-extension-access --disable-safe-unpickle"
sed -i "s/#export COMMANDLINE_ARGS=\"\"/export COMMANDLINE_ARGS=\"$cmdLineArgs\"/" webui-user.sh
./webui.sh -f
