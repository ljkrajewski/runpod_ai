FROM runpod/pytorch:2.0.1-py3.10-cuda11.8.0-devel

ARG BASE=/root
ARG SDBASE=$BASE/stable-diffusion-webui
ARG RPBASE=$BASE/runpod_ai/sd

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND noninteractive\
SHELL=/bin/bash

WORKDIR $BASE

