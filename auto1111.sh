#!/usr/bin/env bash
cd /workspace
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui/
cmdlineArgs="--xformers --enable-insecure-extension-access"
sed -i 's/#export COMMANDLINE_ARGS=""/export COMMANDLINE_ARGS="--share $cmdlineArgs"/' webui-user.sh
./webui.sh -f
