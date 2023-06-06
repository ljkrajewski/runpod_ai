# Text and image creation scripts for RunPod that work
## Table of Contents
1. [Start here](#start-here)
2. [AUTOMATIC1111/Stable Diffusion](#AUTOMATIC1111Stable-Diffusion)
3. [oobabooga/text-generation-webui](#oobaboogatext-generation-webui)
## Start here:
1. Go to [RunPod.io](https://runpod.io) and log in.
2. Go to _Templates_ and pick the _RunPod Pytorch 2.0.1_ template.
3. Select a pod to start.  
    - 48GB+ VRAM for 13B+ LLMs or hi-res Stable Diffusion pictures.
    - 24GB VRAM for most other uses.
4. Set container size to 50GB, volume size 100GB
5. Start the pod instance.
## [AUTOMATIC1111/Stable Diffusion](https://github.com/AUTOMATIC1111/stable-diffusion-webui) (text2image)
1. After starting a RunPod instance, open a web terminal and run the following commands:
```
cd /workspace
git clone https://github.com/ljkrajewski/runpod_ai.git
```
2. From your RunPod control panel, open Jupyter Notebook, then run _/workstation/runpod_ai/stable_diffusion-A1111.ipynb_
3. When the "Running on public URL:" line appears, click on the _gradio.live_ link to enter your Automatic 1111 session.
## [oobabooga/text-generation-webui](https://github.com/oobabooga/text-generation-webui) (text2text)
_Coming soon_
