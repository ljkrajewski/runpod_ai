# Text and image creation scripts for RunPod that work<sup>*</sup>
_<sup>*</sup>This is a work in progress, so take the claim that these scripts/notebooks work with a grain of salt._
## Start here:
1. Go to [RunPod.io](https://runpod.io) and log in.
2. Go to _Templates_ and pick the _RunPod Pytorch 2.0.1_ template.
3. Select a pod to start.  
    - 48GB+ VRAM for 13B+ LLMs or hi-res Stable Diffusion pictures.
    - 20GB VRAM for most other uses.
4. Set the following customizations:
   - Volume size: 150GB
   - HTTP service ports: 8888, 3000, 7860, 8000
5. Start the pod instance.
6. Once RunPod instance has finished booting up, open a terminal either in Jupyter Notebook or through an SSH connection.
7. Inside the terminal, run the following commands:
```
cd /workspace
git clone https://github.com/ljkrajewski/runpod_ai.git
/workspace/runpod_ai/run_me_first.sh
```
8. Click on the project you wish to run and follow its directections.
    - AUTOMATIC1111/Stable Diffusion (text2image)  
_See sd/README.md_ 
    - ComfyUI (text2image)  
_See sd/README.md_
    - ComfyUI/SDXL (text2image)  
_See sdxl/README.md_
    - [bmaltais/kohya_ss (text2image training)]  
_See sdxl/README.md_
    - [kohya-ss/sd-scripts]  
_See sdxl/README.md_
    - [oobabooga/text-generation-webui (text2text)](#oobaboogatext-generation-webui-text2text)
    - [Honkware/text-generation-webui (text2text)](#honkwaretext-generation-webui-text2text)
## [oobabooga/text-generation-webui](https://github.com/oobabooga/text-generation-webui) (text2text)
_Coming soon_
## [Honkware/text-generation-webui](https://github.com/Honkware/text-generation-webui) (text2text)
_Coming soon_
