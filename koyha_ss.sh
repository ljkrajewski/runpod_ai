#!/usr/bin/env bash
cd /workspace
git clone https://github.com/bmaltais/kohya_ss.git
cd kohya_ss/
./setup-runpod.sh
./gui.sh --share --headless
