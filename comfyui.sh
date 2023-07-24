#!/usr/bin/env bash
# ComfyUI for SDXL
USERNAME='ljkrajewski'
TOKEN='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'   #It's only a read token. Have fun.
# But seriously, I'd appreciate it if you went to Hugging Face and got your own token. It's free.
#apt install psmisc -y
fuser -k 3000/tcp

# Manual install - https://github.com/FurkanGozukara/Stable-Diffusion/blob/main/Tutorials/How-To-Use-ComfyUI-On-Your-PC-On-RunPod-On-Colab-With-SDXL.md
cd /workspace
git clone https://github.com/comfyanonymous/ComfyUI.git
# Change default workflow
#mv /workspace/ComfyUI/web/scripts/defaultGraph.js{,.bak}
#sed 's/^{$/export const defaultGraph = {/' /workspace/runpod_ai/settings/ComfyUI_Workflow_SDXL.json > /workspace/ComfyUI/web/scripts/defaultGraph.js

cd /workspace/ComfyUI/models/checkpoints
wget https://$USERNAME:$TOKEN@huggingface.co/stabilityai/stable-diffusion-xl-base-0.9/resolve/main/sd_xl_base_0.9.safetensors
wget https://$USERNAME:$TOKEN@huggingface.co/stabilityai/stable-diffusion-xl-refiner-0.9/resolve/main/sd_xl_refiner_0.9.safetensors
wget https://huggingface.co/SG161222/Realistic_Vision_V4.0/resolve/main/Realistic_Vision_V4.0.safetensors
curl https://civitai.com/api/download/models/90072 -o Photon.safetensors -L

cd /workspace/ComfyUI/models/embeddings
#git clone https://huggingface.co/nolanaatama/embeddings
curl https://civitai.com/api/download/models/77169 -o BadDream.pt -L
curl https://civitai.com/api/download/models/77173 -o UnrealisticDream.pt -L
curl https://civitai.com/api/download/models/94057 -o FastNegativeV2.pt -L

cd /workspace/ComfyUI/models/vae
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors

#cd /workspace/ComfyUI/models/loras

cd /workspace/ComfyUI
#python -m venv venv
#cd venv
#source bin/activate
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
pip install -U --pre xformers
pip install -r requirements.txt

cd /workspace/ComfyUI/models/custom_nodes
#ComfyUI Manager
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
#ControlNet
# Install instructions- https://www.youtube.com/watch?v=FJwcBTL_voc
git clone https://github.com/Fannovel16/comfy_controlnet_preprocessors.git
cd comfy_controlnet_preprocessors
python install.py
cd /workspace/ComfyUI/models/controlnet
git clone https://huggingface.co/lllyasviel/ControlNet-v1-1

cd /workspace/ComfyUI
python main.py --listen 0.0.0.0 --port 3000
