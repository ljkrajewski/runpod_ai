#!/usr/bin/env bash
fuser -k 7860/tcp

BASE='/workspace'
INSTALLBASE="$BASE/oobabooga_linux"
TGWBASE="$BASE/oobabooga_linux/text-generation-webui"
RPBASE="$BASE/runpod_ai/textget"

cd $BASE
#git clone https://github.com/oobabooga/text-generation-webui.git
wget https://github.com/oobabooga/text-generation-webui/releases/download/installers/oobabooga_linux.zip
unzip oobabooga_linux.zip

# -- GPTQ-for-LLaMA
cd $INSTALLBASE
pip install -r requirements.txt
mkdir repositories
cd repositories
git clone https://github.com/oobabooga/GPTQ-for-LLaMa.git -b cuda
cd GPTQ-for-LLaMa && python setup_cuda.py install

# -- Install
cp webui.py{,.bak}
sed -i 's/gpuchoice = input("Input> ").lower()/gpuchoice = "a"/' webui.py
sed -i 's/^        launch_webui()/#        launch_webui()/' webui.py
bash start_linux.sh

# -- Models
cd $TGWBASE/models
#git clone --single-branch --branch gptq-4bit-32g-actorder_True https://huggingface.co/TheBloke/Pygmalion-2-13B-GPTQ
#git clone --single-branch --branch main https://huggingface.co/TehVenom/Pygmalion-7b-4bit-GPTQ-Safetensors
git clone --single-branch --branch main https://huggingface.co/TheBloke/guanaco-65B-GPTQ   #requires 48GB VRAM

cd $TGWBASE
pip install scipy

# -- Start UI
cd $INSTALLBASE
cp webui.py{.bak,}
export OOBABOOGA_FLAGS="--listen -chat --auto-devices --model llama"
bash start_linux.sh
