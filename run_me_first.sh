#!/usr/bin/env bash
apt update && apt upgrade git -y && apt install tmux vim psmisc less unzip -y
python -m pip install --upgrade pip
