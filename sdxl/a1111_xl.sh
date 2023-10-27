#!/usr/bin/env bash
fuser -k 7860/tcp

BASE="/workspace"
SDBASE="$BASE/stable-diffusion-webui"
RPBASE="$BASE/runpod_ai/sdxl"

cd $BASE
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

cd $SDBASE
python -m venv venv
cd venv
source bin/activate

MODELS_DIR="$SDBASE/models/Stable-diffusion"
VAE_DIR="$SDBASE/models/VAE"
LORA_DIR="$SDBASE/models/Lora"
EMBEDDING_DIR="$SDBASE/embeddings"
UPSCALERS_DIR="$SDBASE/models/ESRGAN"
source $RPBASE/sdxl-config-models.sh

## Extentions ##
cd $SDBASE/extensions
#ControlNet (not ready for SDXL)
#Aspect Ratio selector plus

## Start the GUI ##
cd $SDBASE
cp $RPBASE/config.json .
cp $RPBASE/styles.csv .
cp $RPBASE/emb.txt extensions/a1111-sd-webui-tagcomplete/tags/temp
#cmdlineArgs="--share --xformers --enable-insecure-extension-access --disable-safe-unpickle"
cmdLineArgs="--listen --port 7860 --xformers --medvram --no-half-vae --theme dark"
sed -i "s/#export COMMANDLINE_ARGS=\"\"/export COMMANDLINE_ARGS=\"$cmdLineArgs\"/" webui-user.sh
./webui.sh -f
