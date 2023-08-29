#!/usr/bin/env bash
# ComfyUI for SD
BASE='/workspace'
CUIBASE="$BASE/ComfyUI"
#apt install psmisc -y
#fuser -k 3000/tcp

# Manual install - https://github.com/FurkanGozukara/Stable-Diffusion/blob/main/Tutorials/How-To-Use-ComfyUI-On-Your-PC-On-RunPod-On-Colab-With-SDXL.md
cd $BASE
git clone https://github.com/comfyanonymous/ComfyUI.git
# Change default workflow
mv $CUIBASE/web/scripts/defaultGraph.js{,.bak}
#sed 's/^{$/export const defaultGraph = {/' $BASE/runpod_ai/settings/ComfyUI_Workflow_SDXL.json > $CUIBASE/web/scripts/defaultGraph.js
sed 's/^{$/export const defaultGraph = {/' $BASE/runpod_ai/settings/ComfyUI_default.json > $CUIBASE/web/scripts/defaultGraph.js
cd $CUIBASE
python -m venv venv
cd venv
source bin/activate
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
pip install -U --pre xformers
pip install -r requirements.txt

cd $CUIBASE/models/checkpoints
#wget https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors
#wget https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors
#wget https://huggingface.co/SG161222/Realistic_Vision_V4.0/resolve/main/Realistic_Vision_V4.0.safetensors
#curl https://civitai.com/api/download/models/90072 -o Photon.safetensors -L
#curl https://civitai.com/models/25694 -o EpicRealism.safetensors -L
# curl https://civitai.com/models/46422?modelVersionId=117037 -o Juggernaut.safetensors -L
# curl https://civitai.com/models/10540 -o Verisimilitude.safetensors -L
#curl https://civitai.com/models/81458/absolutereality -o AbsoluteReality.safetensors -L
# curl https://civitai.com/models/22922?modelVersionId=72396 -o Lyriel.safetensors -L
#curl https://civitai.com/models/21813?modelVersionId=51913 -o EdgeOfRealism.safetensors -L
# curl https://civitai.com/models/4823?modelVersionId=15236 -o Deliberate.safetensors -L
# curl https://civitai.com/models/4384?modelVersionId=94081 -o DreamShaper.safetensors -L
# curl https://civitai.com/models/36520/ghostmix -o GhostMix.safetensors -L
# curl https://civitai.com/models/57319?modelVersionId=99805 -o A-ZovyaPhotoreal.safetensors -L
# curl https://civitai.com/models/15022?modelVersionId=53814 -o 526Mix.safetensors -L
curl https://civitai.com/api/download/models/130072 -o RealisticVisionV5-1.safetensors -L
curl https://civitai.com/api/download/models/130090 -o RealisticVisionV5-1-inpainting.safetensors -L
#curl https://civitai.com/api/download/models/29682 -o LifeLikeDiffusion.safetensors -L
curl https://civitai.com/api/download/models/145885 -o EpicPhotoGasm.safetensors -L
curl https://civitai.com/api/download/models/146074 -o EpicPhotoGasm-inpanting.safetensors -L

cd $CUIBASE/models/embeddings
#git clone https://huggingface.co/nolanaatama/embeddings
curl https://civitai.com/api/download/models/77169 -o BadDream.pt -L
curl https://civitai.com/api/download/models/77173 -o UnrealisticDream.pt -L
curl https://civitai.com/api/download/models/94057 -o FastNegativeV2.pt -L
curl https://civitai.com/api/download/models/125849 -o Bad-Hands-5.pt -L

cd $CUIBASE/models/vae
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors

cd $CUIBASE/models/loras
curl https://civitai.com/api/download/models/63006 -o LowRA.safetensors -L
curl https://civitai.com/api/download/models/17988 -o 20D.safetensors -L
curl https://civitai.com/api/download/models/62833 -o DetailTweaker.safetensors -L

cd $CUIBASE/models/upscale_models
curl https://civitai.com/api/download/models/70526 -o VariousUpscalers.zip -L
unzip VariousUpscalers.zip

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
#mkdir -p $CUIBASE/models/mmdets/bbox
#cd $CUIBASE/models/mmdets/bbox
#wget https://huggingface.co/dustysys/ddetailer/resolve/main/mmdet/bbox/mmdet_anime-face_yolov3.pth
#wget https://raw.githubusercontent.com/Bing-su/dddetailer/master/config/mmdet_anime-face_yolov3.py
#mkdir -p $CUIBASE/models/sams
#cd $CUIBASE/models/sams
#wget https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth
cd $CUIBASE/custom_nodes
# -- ComfyUI FaceRestore Node - https://civitai.com/models/24690/comfyui-facerestore-node
curl https://civitai.com/api/download/models/122586  -o FaceRestore.zip -L
unzip FaceRestore.zip
mkdir -p $CUIBASE/models/facerestore_models/
cd $CUIBASE/models/facerestore_models/
wget https://github.com/TencentARC/GFPGAN/releases/download/v1.3.4/GFPGANv1.4.pth
wget https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/codeformer.pth
mkdir -p $CUIBASE/models/facedetection/
cd $CUIBASE/models/facedetection/
wget https://github.com/xinntao/facexlib/releases/download/v0.1.0/detection_Resnet50_Final.pth
wget https://github.com/xinntao/facexlib/releases/download/v0.1.0/detection_mobilenet0.25_Final.pth
wget https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/yolov5l-face.pth
wget https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/yolov5n-face.pth
wget https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/parsing_parsenet.pth
cd $CUIBASE/custom_nodes
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
