#!/usr/bin/env bash
cd /workspace
git clone https://github.com/bmaltais/kohya_ss.git
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors

cd kohya_ss/
./setup-runpod.sh
./gui.sh --share --headless
