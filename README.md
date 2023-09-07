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
    - [bmaltais/kohya_ss (text2image training)](#bmaltaiskohya_ss-text2image-training)
    - [kohya-ss/sd-scripts](#kohya-sssd-scripts-text2image-training)
    - [oobabooga/text-generation-webui (text2text)](#oobaboogatext-generation-webui-text2text)
    - [Honkware/text-generation-webui (text2text)](#honkwaretext-generation-webui-text2text)
## [bmaltais/kohya_ss](https://github.com/bmaltais/kohya_ss) (text2image training)
### Training resources:
- [Tutorial: Dreambooth LoRA training using Kohya_SS (article)](https://civitai.com/articles/391/tutorial-dreambooth-lora-training-using-kohyass)
- [The guide to fine-tuning Stable Diffusion with your own images (article)](https://tryolabs.com/blog/2022/10/25/the-guide-to-fine-tuning-stable-diffusion-with-your-own-images)
- [Training LoRA with Kohya (theory included!) (YouTube)](https://www.youtube.com/watch?v=xholR62Q2tY)
- [LORA + Checkpoint Model Training GUIDE - Get the BEST RESULTS super easy (YouTube)](https://www.youtube.com/watch?v=j-So4VYTL98)
### Directions:
1. In a new terminal session, run
   ```
   cd /workspace/runpod_ai/koyha-ss
   ./koyha_ss-1.sh
   ```
2. Answer the prompts and follow the directions.
## [kohya-ss/sd-scripts](https://github.com/kohya-ss/sd-scripts/tree/sdxl) (text2image training)
### Training resources:
- [Stable Diffusion SDXL LoRA Training Tutorial (YouTube)](https://www.youtube.com/watch?v=iNwB98P3V0k)
- sd-scripts:
  - [LoRA training](https://github.com/darkstorm2150/sd-scripts/blob/main/docs/train_network_README-en.md)
  - [common learning guide](https://github.com/darkstorm2150/sd-scripts/blob/main/docs/train_README-en.md)
- [Super Resolution API](https://deepai.org/machine-learning-model/torch-srgan)
  
_Coming soon_
## [oobabooga/text-generation-webui](https://github.com/oobabooga/text-generation-webui) (text2text)
_Coming soon_
## [Honkware/text-generation-webui](https://github.com/Honkware/text-generation-webui) (text2text)
_Coming soon_
