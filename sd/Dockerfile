RUN FROM runpod/pytorch:2.0.1-py3.10-cuda11.8.0-devel

ARG BASE=/usr/local
ARG SDBASE=$BASE/stable-diffusion-webui
#ARG RPBASE=$BASE/runpod_ai/sd

ARG MODELS_DIR=$SDBASE/models/Stable-diffusion
ARG VAE_DIR=$SDBASE/models/VAE
ARG LORA_DIR=$SDBASE/models/Lora
ARG EMBEDDING_DIR=$SDBASE/embeddings
ARG UPSCALERS_DIR=$SDBASE/models/ESRGAN

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND noninteractive\
#SHELL=/bin/bash

WORKDIR $BASE

RUN apt update && \
    apt upgrade git -y && \
    apt install tmux vim psmisc less unzip -y && \
    python -m pip install --upgrade pip && \
    git clone --depth=1 https://github.com/AUTOMATIC1111/stable-diffusion-webui.git && \
    python -m venv /venv

WORKDIR $SDBASE
RUN [ ! -d $MODELS_DIR ] && mkdir $MODELS_DIR &&\
    [ ! -d $VAE_DIR ] && mkdir $VAE_DIR &&\
    [ ! -d $LORA_DIR ] && mkdir $LORA_DIR &&\
    [ ! -d $EMBEDDING_DIR ] && mkdir $EMBEDDING_DIR &&\
    [ ! -d $UPSCALERS_DIR ] && mkdir $UPSCALERS_DIR

WORKDIR $MODELS_DIR
RUN wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors && \
    curl https://civitai.com/api/download/models/130072 -o RealisticVisionV5-1.safetensors -L && \
    curl https://civitai.com/api/download/models/130090 -o RealisticVisionV5-1-inpainting.safetensors -L && \
    curl https://civitai.com/api/download/models/145885 -o EpicPhotoGasm.safetensors -L && \
    curl https://civitai.com/api/download/models/146074 -o EpicPhotoGasm-inpanting.safetensors -L
WORKDIR $VAE_DIR
RUN wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors && \
    wget https://huggingface.co/LarryAIDraw/anything-v4.0.vae/resolve/main/anything-v4.0.vae.pt && \
    wget https://huggingface.co/iZELX1/Grapefruit/raw/main/Grapefruit.vae.pt
WORKDIR $LORA_DIR
RUN curl https://civitai.com/api/download/models/63006 -o LowRA.safetensors -L && \
    curl https://civitai.com/api/download/models/17988 -o 20D.safetensors -L && \
    curl https://civitai.com/api/download/models/62833 -o DetailTweaker.safetensors -L && \
    curl https://civitai.com/api/download/models/156286 -o EpicRealLife.safetensors -L
WORKDIR $EMBEDDING_DIR
RUN curl https://civitai.com/api/download/models/77169 -o BadDream.pt -L && \
    curl https://civitai.com/api/download/models/77173 -o UnrealisticDream.pt -L && \
    curl https://civitai.com/api/download/models/94057 -o FastNegativeV2.pt -L && \
    curl https://civitai.com/api/download/models/125849 -o Bad-Hands-5.pt -L
WORKDIR $UPSCALERS_DIR
RUN wget https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/8x_NMKD-Superscale_150000_G.pth && \
    wget https://nmkd.de/shared/ESRGAN/Models/Faces/8x_NMKD-Faces_160000_G.pth && \
    wget https://huggingface.co/lokCX/4x-Ultrasharp/resolve/main/4x-UltraSharp.pth
WORKDIR $SDBASE/extensions
RUN git clone --depth=1 https://github.com/kohya-ss/sd-webui-additional-networks.git && \   # Kohya-ss/Additional Networks models (https://github.com/kohya-ss/sd-webui-additional-networks.git)
    git clone --depth=1 https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git && \   # Booru Tag Autocomplete
    git clone --depth=1 https://github.com/AlUlkesh/stable-diffusion-webui-images-browser.git && \   # Image browser
    git clone --depth=1 https://github.com/thomasasfk/sd-webui-aspect-ratio-helper.git && \   # Aspect Ratio Helper
    git clone --depth=1 https://github.com/vladmandic/sd-extension-system-info.git && \   # System Info
    git clone --depth=1 https://github.com/adieyal/sd-dynamic-prompts.git && \   # Stable Diffusion Dynamic Prompts
    git clone --depth=1 https://github.com/Mikubill/sd-webui-controlnet.git   # ControlNet for Stable Diffusion WebUI (https://github.com/Mikubill/sd-webui-controlnet)

WORKDIR $SDBASE/extensions/sd-webui-controlnet/models
RUN git clone --depth=1 https://huggingface.co/lllyasviel/ControlNet-v1-1

WORKDIR $SDBASE
COPY config.json $SDBASE
COPY emb.txt $SDBASE/extensions/a1111-sd-webui-tagcomplete/tags/temp
# RUN sed -i 's/BASE=\"/workspace\"/BASE=\"$BASE\"/' $RPBASE/auto1111.sh
ARG cmdLineArgs "--listen --port 7860 --xformers --enable-insecure-extension-access --disable-safe-unpickle"
RUN sed -i "s/#export COMMANDLINE_ARGS=\"\"/export COMMANDLINE_ARGS=\"$cmdLineArgs\"/" webui-user.sh
# ./webui.sh -f

CMD [ "/start.sh" ]
