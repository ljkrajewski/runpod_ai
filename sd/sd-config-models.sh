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
[ ! -f v1-5-pruned.safetensors ] && \
  wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors
[ ! -f sd-v1-5-inpainting.ckpt ] && \
  wget https://huggingface.co/runwayml/stable-diffusion-inpainting/resolve/main/sd-v1-5-inpainting.ckpt
#[ ! -f edgeOfRealism.safetensors ] && \
#  curl https://civitai.com/api/download/models/51913 -o edgeOfRealism.safetensors -L
#[ ! -f Photon.safetensors ] && \
#  curl https://civitai.com/api/download/models/90072 -o Photon.safetensors -L
[ ! -f RealisticVisionV5-1.safetensors ] && \
  curl https://civitai.com/api/download/models/130072 -o RealisticVisionV5-1.safetensors -L
[ ! -f RealisticVisionV5-1-inpainting.safetensors ] && \
  curl https://civitai.com/api/download/models/130090 -o RealisticVisionV5-1-inpainting.safetensors -L
[ ! -f EpicPhotoGasm.safetensors ] && \
  curl https://civitai.com/api/download/models/145885 -o EpicPhotoGasm.safetensors -L
[ ! -f EpicPhotoGasm-inpanting.safetensors ] && \
  curl https://civitai.com/api/download/models/146074 -o EpicPhotoGasm-inpanting.safetensors -L
[ ! -f epicrealismNaturalSinRC1.safetensors ] && \
  curl https://civitai.com/api/download/models/143497 -o epicrealismNaturalSinRC1.safetensors -L

## VAEs
[ ! -d "$VAE_DIR" ] && mkdir "$VAE_DIR"
cd "$VAE_DIR"
[ ! -f vae-ft-mse-840000-ema-pruned.safetensors ] && \
  wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors
[ ! -f anything-v4.0.vae.pt ] && \
  wget https://huggingface.co/LarryAIDraw/anything-v4.0.vae/resolve/main/anything-v4.0.vae.pt
[ ! -f Grapefruit.vae.pt ] && \
  wget https://huggingface.co/iZELX1/Grapefruit/raw/main/Grapefruit.vae.pt
[ ! -f epicrealismNaturalSinRC1VAE.safetensors ] && \
  curl https://civitai.com/api/download/models/143906 -o epicrealismNaturalSinRC1VAE.safetensors -L

## LoRAs
[ ! -d "$LORA_DIR" ] && mkdir "$LORA_DIR"
cd "$LORA_DIR"
[ ! -f LowRA.safetensors ] && \
  curl https://civitai.com/api/download/models/63006 -o LowRA.safetensors -L
[ ! -f 20D.safetensors ] && \
  curl https://civitai.com/api/download/models/17988 -o 20D.safetensors -L
[ ! -f DetailTweaker.safetensors ] && \
  curl https://civitai.com/api/download/models/62833 -o DetailTweaker.safetensors -L
[ ! -f EpicRealLife.safetensors ] && \
  curl https://civitai.com/api/download/models/156286 -o EpicRealLife.safetensors -L

## Embeddings
[ ! -d "$EMBEDDING_DIR" ] && mkdir "$EMBEDDING_DIR"
cd "$EMBEDDING_DIR"
[ ! -f BadDream.pt ] && \
  curl https://civitai.com/api/download/models/77169 -o BadDream.pt -L
[ ! -f UnrealisticDream.pt ] && \
  curl https://civitai.com/api/download/models/77173 -o UnrealisticDream.pt -L
[ ! -f FastNegativeV2.pt ] && \
  curl https://civitai.com/api/download/models/94057 -o FastNegativeV2.pt -L
[ ! -f Bad-Hands-5.pt ] && \
  curl https://civitai.com/api/download/models/125849 -o Bad-Hands-5.pt -L

## Upscalers
[ ! -d "$UPSCALERS_DIR" ] && mkdir "$UPSCALERS_DIR"
cd "$UPSCALERS_DIR"
[ ! -f 8x_NMKD-Superscale_150000_G.pth ] && \
  wget https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/8x_NMKD-Superscale_150000_G.pth
[ ! -f 8x_NMKD-Faces_160000_G.pth ] && \
  wget https://nmkd.de/shared/ESRGAN/Models/Faces/8x_NMKD-Faces_160000_G.pth
[ ! -f 4x-UltraSharp.pth ] && \
  wget https://huggingface.co/lokCX/4x-Ultrasharp/resolve/main/4x-UltraSharp.pth
#[ ! -f VariousUpscalers.zip ] && \
#  curl https://civitai.com/api/download/models/70526 -o VariousUpscalers.zip -L && \
#  unzip VariousUpscalers.zip
