#!/usr/bin/env bash
# ComfyUI for SD

BASE='/workspace'
CUIBASE="$BASE/ComfyUI"
RPBASE="$BASE/sd/runpod_ai"

# Manual install - https://github.com/FurkanGozukara/Stable-Diffusion/blob/main/Tutorials/How-To-Use-ComfyUI-On-Your-PC-On-RunPod-On-Colab-With-SDXL.md
cd $BASE
git clone https://github.com/comfyanonymous/ComfyUI.git
# Change default workflow
mv $CUIBASE/web/scripts/defaultGraph.js{,.bak}
sed 's/^{$/export const defaultGraph = {/' $RPBASE/settings/ComfyUI_default.json > $CUIBASE/web/scripts/defaultGraph.js

cd $CUIBASE
python -m venv venv
cd venv
source bin/activate

cd ..
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
pip install -U --pre xformers
pip install -r requirements.txt

MODELS_DIR="$CUIBASE/models/checkpoints"
VAE_DIR="$CUIBASE/models/vae"
LORA_DIR="$CUIBASE/models/loras"
EMBEDDING_DIR="$CUIBASE/models/embeddings"
UPSCALERS_DIR="$CUIBASE/models/upscale_models"
source $RPBASE/sd-config-models.sh

cd $CUIBASE/custom_nodes
# -- ComfyUI Manager
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
# -- Impact Pack
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git
cd ComfyUI-Impact-Pack
git submodule update --init --recursive
python install.py
cp impact-pack.ini{,.bu}
sed -i 's/mmdet_skip = True/mmdet_skip = False/' impact-pack.ini
cd $CUIBASE/custom_nodes
# -- ComfyUI Face Restore
# Use DDetailer from Impact Pack (https://github.com/ltdrdata/ComfyUI-Impact-Pack#how-to-use-ddetailer-feature)
# Tutorial: https://www.youtube.com/watch?v=z4JzuuFyr1Y
# -- Derfuu_ComfyUI_ModdedNodes
git clone https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes.git
# -- ReActor
git clone https://github.com/Gourieff/comfyui-reactor-node.git
cd comfyui-reactor-node
python install.py
cd $CUIBASE/custom_nodes
# -- UltimateSDUpscale
git clone https://github.com/ssitu/ComfyUI_UltimateSDUpscale.git --recursive
# -- ComfyMath
git clone https://github.com/evanspearman/ComfyMath.git
# -- Recommended Resolution Calculator
git clone https://github.com/marhensa/sdxl-recommended-res-calc.git
# -- ControlNet
git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git
cd comfyui_controlnet_aux
python -s -m pip install -r requirements.txt

cd $CUIBASE
python main.py --listen 0.0.0.0 --port 3000
