#!/usr/bin/env bash

BASE="/workspace"
RPBASE="$BASE/runpod_ai/kohya_ss"
KSSBASE="$BASE/kohya_ss"
TRAININGDIR="$BASE/training"

cd $BASE
git clone https://github.com/bmaltais/kohya_ss.git
cd $KSSBASE
python -m venv venv
cd venv
source bin/activate

cd $TRAININGDIR
[ ! -f v1-5-pruned.safetensors ] && \
  wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors
#curl https://civitai.com/api/download/models/90072 -o Photon.safetensors -L

cd $KSSBASE
./setup-runpod.sh
./gui.sh --share --headless
