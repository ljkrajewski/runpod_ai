#!/usr/bin/env bash
# ComfyUI for SDXL

cd /workspace
git clone https://github.com/comfyanonymous/ComfyUI.git
cd /workspace/ComfyUI/models/checkpoints
wget https://huggingface.co/stabilityai/stable-diffusion-xl-base-0.9/resolve/main/sd_xl_base_0.9.safetensors
wget https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-0.9/resolve/main/sd_xl_refiner_0.9.safetensors
curl https://civitai.com/api/download/models/114367 -o "Realistic Vision V4.0.safetensors" -L
cd /workspace/ComfyUI/models/vae
wget https://huggingface.co/YANGYINGDUO/vae-ft-mse-840000-ema-pruned.ckpt/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt
