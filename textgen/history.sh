#!/usr/bin/env bash

BASE='/workspace'
INSTALLBASE="$BASE/oobabooga_linux"
TGWBASE="$BASE/oobabooga_linux/text-generation-webui"
RPBASE="$BASE/runpod_ai/textget"

cd $BASE
wget https://github.com/oobabooga/text-generation-webui/releases/download/installers/oobabooga_linux.zip
unzip oobabooga_linux.zip

cd $INSTALLBASE
mkdir repositories
cd repositories
git clone https://github.com/oobabooga/GPTQ-for-LLaMa.git -b cuda
cd GPTQ-for-LLaMa && python setup_cuda.py install

cd $INSTALLBASE
cp webui.py{,.bak}
sed -i 's/gpuchoice = input("Input> ").lower()/gpuchoice = "a"/' webui.py
sed -i 's/^        launch_webui()/#        launch_webui()/' webui.py
bash start_linux.sh
cd $TGWBASE/models
git lfs install
#git clone --single-branch --branch main https://huggingface.co/TheBloke/Guanaco-13B-Uncensored-GPTQ  
git clone --single-branch --branch main https://huggingface.co/TheBloke/WizardCoder-15B-1.0-GPTQ

cd $TGWBASE
pip install scipy

cd $INSTALLBASE
cp webui.py{.bak,}
export OOBABOOGA_FLAGS="--listen --chat --auto-devices --model llama"
bash start_linux.sh

