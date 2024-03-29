#!/usr/bin/env bash
# Download common files for Stable Diffusion here.
# Make sure this script is called with 'source', eg, source ./sd-config-modules.sh
# and that the following variables are set before this script is called:
#  - MODELS_DIR
#  - VAE_DIR
#  - LORA_DIR
#  - EMBEDDING_DIR
#  - UPSCALERS_DIR

function dlFromGoogle {
#because Google is a pain in the @$$.
#Downloads a file from Google drive to the current directory.
#Usage: dlFromGoogle 'http://drive.google.com/link/to/file' 'filename.ext'
  fileid=`echo $1 | awk -F '/' '{ print $6 }'`
  html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=$fileid"`
  curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo $html|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=$fileid" -o $2
}

## Models
[ ! -d "$MODELS_DIR" ] && mkdir "$MODELS_DIR"
cd "$MODELS_DIR"
[ ! -f sd_xl_base_1.0.safetensors ] && \
  wget https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors
[ ! -f sd_xl_refiner_1.0.safetensors ] && \
  wget https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors
[ ! -f DreamShaperXL.safetensors ] && \
  curl https://civitai.com/api/download/models/126688 -o DreamShaperXL.safetensors -L  
[ ! -f crystalClearXL-ccxl.safetensors ] && \
  curl https://civitai.com/api/download/models/133832 -o crystalClearXL-ccxl.safetensors -L
[ ! -f JuggernautXL_version3.safetensors ] && \
  curl https://civitai.com/api/download/models/156005 -o JuggernautXL_version3.safetensors -L

## VAEs
[ ! -d "$VAE_DIR" ] && mkdir "$VAE_DIR"
cd "$VAE_DIR"
[ ! -f sd_xl_base_1.0_0.9vae.safetensors ] && \
  wget https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0_0.9vae.safetensors
[ ! -f sd_xl_refiner_1.0_0.9vae.safetensors ] && \
  wget https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0_0.9vae.safetensors
[ ! -f sdxl_vae.safetensors ] && \
  wget https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors
#[ ! -f CrystalClearXLvae.??? ] && \
#  curl 'https://civitai.com/api/download/models/133832?type=VAE' -o sdxl_vae.safetensors -L
#[ ! -f JuggernautXLvae.??? ] && \
#  curl 'https://civitai.com/api/download/models/156005?type=VAE' -o sdxl_vae.safetensors -L

## LoRAs
[ ! -d "$LORA_DIR" ] && mkdir "$LORA_DIR"
cd "$LORA_DIR"
[ ! -f XL_itoStyleLycoris.safetensors ] && \
  curl 'https://civitai.com/api/download/models/131386' -o XL_itoStyleLycoris.safetensors -L
[ ! -f sdxl_photorealistic_slider-v1.0.safetensors ] && \
  curl 'https://civitai.com/api/download/models/126807' -o sdxl_photorealistic_slider-v1.0.safetensors -L

## Embeddings
# [ ! -d "$EMBEDDING_DIR" ] && mkdir "$EMBEDDING_DIR"
# cd "$EMBEDDING_DIR"

## Upscalers
# [ ! -d "$UPSCALERS_DIR" ] && mkdir "$UPSCALERS_DIR"
# cd "$UPSCALERS_DIR"

