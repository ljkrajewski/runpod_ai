#!/usr/bin/env bash
cd /workspace
git clone https://github.com/bmaltais/kohya_ss.git
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors
mkdir -p /workspace/training/log
mkdir -p /workspace/training/img/tmp
mkdir -p /workspace/training/model
mkdir -p /workspace/training/reg/tmp



cd kohya_ss/
./setup-runpod.sh
./gui.sh --share --headless
