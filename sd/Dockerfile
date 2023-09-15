FROM runpod/pytorch:2.0.1-py3.10-cuda11.8.0-devel

ARG BASE=/root
ARG SDBASE=$BASE/stable-diffusion-webui
ARG RPBASE=$BASE/runpod_ai/sd

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND noninteractive\
SHELL=/bin/bash

WORKDIR $BASE

RUN apt update && \
    apt upgrade git -y && \
    apt install tmux vim psmisc less unzip -y && \
    python -m pip install --upgrade pip && \
    cd $BASE && \
    git clone --depth 1 https://github.com/ljkrajewski/runpod_ai.git && \
    cd $RPBASE && \
    sed -i 's/BASE=\"/workspace\"/BASE=\"$BASE\"/' $RPBASE/auto1111.sh

CMD [ "/start.sh &; $RPBASE/auto1111.sh" ]
