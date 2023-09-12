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

cd $INSTALLBASE
cp webui.py{,.bak}
sed -i 's/gpuchoice = input("Input> ").lower()/gpuchoice = "a"/' webui.py
sed -i 's/^        launch_webui()/#        launch_webui()/' webui.py
export OOBABOOGA_FLAGS="--listen"
bash start_linux.sh

# -- Mode;s
cd $TGWBASE
git clone --single-branch --branch gptq-4bit-32g-actorder_True https://huggingface.co/TheBloke/Pygmalion-2-13B-GPTQ

cd $TGWBASE
python server.py $OOBABOOGA_FLAGS
