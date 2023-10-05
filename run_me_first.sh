#!/usr/bin/env bash
apt update && apt upgrade git -y && apt install tmux vim psmisc less unzip git-lfs -y
python -m pip install --upgrade pip
pip install virtualenv
