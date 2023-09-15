FROM runpod/pytorch:2.0.1-py3.10-cuda11.8.0-devel

ARG BASE=/root
ARG CUIBASE=$BASE/ComfyUI
ARG RPBASE=$BASE/runpod_ai/sdxl

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND noninteractive\
SHELL=/bin/bash

WORKDIR $BASE

RUN git clone --depth 1 https://github.com/ljkrajewski/runpod_ai.git && \
    cd $RPBASE && \
    mv $CUIBASE/web/scripts/defaultGraph.js{,.bak} && \
    sed 's/^{$/export const defaultGraph = {/' $RPBASE/ComfyUI_Workflow_SDXL.json > $CUIBASE/web/scripts/defaultGraph.js && \
    

git clone --depth 1 https://github.com/comfyanonymous/ComfyUI.git
