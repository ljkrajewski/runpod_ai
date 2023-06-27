# Text and image creation scripts for RunPod that work<sup>*</sup>
_<sup>*</sup>This is a work in progress, so take the claim that these scripts/notebooks work with a grain of salt._
## Table of Contents
1. [Start here](#start-here)
2. [AUTOMATIC1111/Stable Diffusion (text2image)](#automatic1111stable-diffusion-text2image)
3. [oobabooga/text-generation-webui (text2text)](#oobaboogatext-generation-webui-text2text)
4. [Honkware/text-generation-webui (text2text)](#honkwaretext-generation-webui-text2text)
5. [bmaltais/kohya_ss (text2image training)](#bmaltaiskohya_ss-text2image-training)
## Start here:
1. Go to [RunPod.io](https://runpod.io) and log in.
2. Go to _Templates_ and pick the _RunPod Pytorch 2.0.1_ template.
3. Select a pod to start.  
    - 48GB+ VRAM for 13B+ LLMs or hi-res Stable Diffusion pictures.
    - 24GB VRAM for most other uses.
4. Set container size to 50GB, volume size 100GB
5. Start the pod instance.
6. After starting a RunPod instance, open a web terminal and run the following commands:
```
cd /workspace
git clone https://github.com/ljkrajewski/runpod_ai.git
```
## [AUTOMATIC1111/Stable Diffusion](https://github.com/AUTOMATIC1111/stable-diffusion-webui) (text2image)
1. From your RunPod control panel, open Jupyter Notebook, then run _/workstation/runpod_ai/stable_diffusion-A1111.ipynb_
2. When the "Running on public URL:" line appears, click on the _gradio.live_ link to enter your Automatic 1111 session.
## [oobabooga/text-generation-webui](https://github.com/oobabooga/text-generation-webui) (text2text)
_Coming soon_
## [Honkware/text-generation-webui](https://github.com/Honkware/text-generation-webui) (text2text)
_Coming soon_
## [bmaltais/kohya_ss](https://github.com/bmaltais/kohya_ss) (text2image training)
_Coming soon_
