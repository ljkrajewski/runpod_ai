#!/usr/bin/env bash
# ComfyUI for SDXL
USERNAME='ljkrajewski'
TOKEN='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'   #It's only a read token. Have fun.
apt install psmisc -y
fuser -k 3000/tcp

# Manual install - https://github.com/FurkanGozukara/Stable-Diffusion/blob/main/Tutorials/How-To-Use-ComfyUI-On-Your-PC-On-RunPod-On-Colab-With-SDXL.md
cd /workspace
git clone https://github.com/comfyanonymous/ComfyUI.git
cd /workspace/ComfyUI
python -m venv venv
cd venv
source bin/activate
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
pip install -U --pre xformers
cd ..
pip install -r requirements.txt

cd /workspace/ComfyUI/models/checkpoints
wget https://$USERNAME:$TOKEN@huggingface.co/stabilityai/stable-diffusion-xl-base-0.9/resolve/main/sd_xl_base_0.9.safetensors
wget https://$USERNAME:$TOKEN@huggingface.co/stabilityai/stable-diffusion-xl-refiner-0.9/resolve/main/sd_xl_refiner_0.9.safetensors
wget https://huggingface.co/SG161222/Realistic_Vision_V4.0/resolve/main/Realistic_Vision_V4.0.safetensors
cd /workspace/ComfyUI/models/vae
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors

cd /workspace/ComfyUI
pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118 xformers
# If you get the "Torch not compiled with CUDA enabled" error, uninstall torch with:
#pip uninstall torch
pip install -r requirements.txt

python main.py --listen 0.0.0.0 --port 3000
