#!/usr/bin/env bash
link=$1
#eg: https://civitai.com/api/download/models/51913
filename=$2
#eg: edge-of-realism.safetensors
cd /workspace/runpod_ai/stable-diffusion-webui/models/Stable-diffusion/  #if downloading a checkpoint
#cd /workspace/runpod_ai/stable-diffusion-webui/models/Lora  #if downloading a Lora
curl $link -o $filename -L
