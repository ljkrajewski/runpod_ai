#!/usr/bin/env bash
# ComfyUI for SDXL

cd /workspace
git clone https://github.com/comfyanonymous/ComfyUI.git
cd /workspace/ComfyUI/models/checkpoints
# Download checkpoints
cd /workspace/ComfyUI/models/vae
wget https://huggingface.co/YANGYINGDUO/vae-ft-mse-840000-ema-pruned.ckpt/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt
