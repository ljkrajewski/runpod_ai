#!/usr/bin/env bash
fuser -k 7860/tcp

BASE='/workspace'
SDBASE="$BASE/stable-diffusion-webui"
RPBASE="$BASE/runpod_ai"
#source $RPBASE/initial_setup.sh

function dlFromGoogle {
#because Google is a pain in the @$$.
#Downloads a file from Google drive to the current directory.
#Usage: dlFromGoogle 'http://drive.google.com/link/to/file' 'filename.ext'
  fileid=`echo $1 | awk -F '/' '{ print $6 }'`
  html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=$fileid"`
  curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo $html|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=$fileid" -o $2
}

cd $BASE
#git lfs install
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

:<<COMMENT
## Models ##
cd $SDBASE/models/Stable-diffusion
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors
#curl https://civitai.com/api/download/models/51913 -o edgeOfRealism.safetensors -L
#curl https://civitai.com/api/download/models/90072 -o Photon.safetensors -L
curl https://civitai.com/api/download/models/130072 -o RealisticVisionV5-1.safetensors -L
curl https://civitai.com/api/download/models/130090 -o RealisticVisionV5-1-inpainting.safetensors -L
curl https://civitai.com/api/download/models/145885 -o EpicPhotoGasm.safetensors -L
curl https://civitai.com/api/download/models/146074 -o EpicPhotoGasm-inpanting.safetensors -L

## VAE ##
cd $SDBASE/models/VAE
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors
wget https://huggingface.co/LarryAIDraw/anything-v4.0.vae/resolve/main/anything-v4.0.vae.pt
wget https://huggingface.co/iZELX1/Grapefruit/raw/main/Grapefruit.vae.pt

## LoRAs ##
mkdir -p $SDBASE/models/Lora
cd $SDBASE/models/Lora
curl https://civitai.com/api/download/models/63006 -o LowRA.safetensors -L
curl https://civitai.com/api/download/models/17988 -o 20D.safetensors -L
curl https://civitai.com/api/download/models/62833 -o DetailTweaker.safetensors -L

## Embeddings ##
cd $SDBASE/embeddings
#git clone https://huggingface.co/nolanaatama/embeddings
curl https://civitai.com/api/download/models/77169 -o BadDream.pt -L
curl https://civitai.com/api/download/models/77173 -o UnrealisticDream.pt -L
curl https://civitai.com/api/download/models/94057 -o FastNegativeV2.pt -L
curl https://civitai.com/api/download/models/125849 -o Bad-Hands-5.pt -L

## Upscalers ##
mkdir -p $SDBASE/models/ESRGAN
cd $SDBASE/models/ESRGAN
wget https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/8x_NMKD-Superscale_150000_G.pth
wget https://nmkd.de/shared/ESRGAN/Models/Faces/8x_NMKD-Faces_160000_G.pth
COMMENT

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
