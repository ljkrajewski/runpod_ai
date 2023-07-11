#!/usr/bin/env bash
cd /workspace
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

cd /workspace/stable-diffusion-webui/models/Stable-diffusion
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors
wget https://civitai.com/api/download/models/51913 && mv 51913 edgeOfRealism.safetensors

cd /workspace/stable-diffusion-webui/extensions
# Kohya-ss/Additional Networks models (https://github.com/kohya-ss/sd-webui-additional-networks.git)
git clone https://github.com/kohya-ss/sd-webui-additional-networks.git
# ControlNet for Stable Diffusion WebUI (https://github.com/Mikubill/sd-webui-controlnet)
git clone https://github.com/Mikubill/sd-webui-controlnet.git
cd sd-webui-controlnet/models
git lfs install
git clone https://huggingface.co/lllyasviel/ControlNet-v1-1

cd /workspace/stable-diffusion-webui/
cmdlineArgs="--xformers --enable-insecure-extension-access"
sed -i 's/#export COMMANDLINE_ARGS=""/export COMMANDLINE_ARGS="--share $cmdlineArgs"/' webui-user.sh
./webui.sh -f
