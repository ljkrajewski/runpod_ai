#!/usr/bin/env bash
# Configure common downloaded files for Stable Diffusion here.
# Make sure this script is called with 'source', eg, source ./sd-config-modules.sh
# and that the directories are set in their variables before calling this script.

## Models
[ -d "$MODELS_DIR" ] || mkdir "$MODELS_DIR" && cd "$MODELS_DIR"
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors
#curl https://civitai.com/api/download/models/51913 -o edgeOfRealism.safetensors -L
#curl https://civitai.com/api/download/models/90072 -o Photon.safetensors -L
curl https://civitai.com/api/download/models/130072 -o RealisticVisionV5-1.safetensors -L
curl https://civitai.com/api/download/models/130090 -o RealisticVisionV5-1-inpainting.safetensors -L
curl https://civitai.com/api/download/models/145885 -o EpicPhotoGasm.safetensors -L
curl https://civitai.com/api/download/models/146074 -o EpicPhotoGasm-inpanting.safetensors -L

## VAEs
[ -d "$VAE_DIR" ] || mkdir "$VAE_DIR" && cd "$VAE_DIR"
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors
wget https://huggingface.co/LarryAIDraw/anything-v4.0.vae/resolve/main/anything-v4.0.vae.pt
wget https://huggingface.co/iZELX1/Grapefruit/raw/main/Grapefruit.vae.pt

## LoRAs
[ -d "$LORA_DIR" ] || mkdir "$LORA_DIR" && cd "$LORA_DIR"
curl https://civitai.com/api/download/models/63006 -o LowRA.safetensors -L
curl https://civitai.com/api/download/models/17988 -o 20D.safetensors -L
curl https://civitai.com/api/download/models/62833 -o DetailTweaker.safetensors -L

## Embeddings
[ -d "$EMBEDDING_DIR" ] || mkdir "$EMBEDDING_DIR" && cd "$EMBEDDING_DIR"
curl https://civitai.com/api/download/models/77169 -o BadDream.pt -L
curl https://civitai.com/api/download/models/77173 -o UnrealisticDream.pt -L
curl https://civitai.com/api/download/models/94057 -o FastNegativeV2.pt -L
curl https://civitai.com/api/download/models/125849 -o Bad-Hands-5.pt -L

## Upscalers
[ -d "$UPSCALERS_DIR" ] || mkdir "$UPSCALERS_DIR" && cd "$UPSCALERS_DIR"
wget https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/8x_NMKD-Superscale_150000_G.pth
wget https://nmkd.de/shared/ESRGAN/Models/Faces/8x_NMKD-Faces_160000_G.pth
curl https://civitai.com/api/download/models/70526 -o VariousUpscalers.zip -L
unzip VariousUpscalers.zip
