#!/usr/bin/env bash
link=$1
#eg: https://civitai.com/api/download/models/51913
filename=$2
#eg: edge-of-realism.safetensors
destDir=$3
#eg: /workspace/runpod_ai/stable-diffusion-webui/models/Stable-diffusion if a checkpoint
#    /workspace/runpod_ai/stable-diffusion-webui/models/Lora if a Lora
cd $destDir
curl $link -o $filename -L
