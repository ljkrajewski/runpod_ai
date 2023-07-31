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
   - HTTP service ports: 3000, 7860, 8000
5. Start the pod instance.
6. Once RunPod instance has finished booting up, connect to Jupyter Notebook and open a terminal tab.
7. Inside the terminal tab, run the following commands:
```
cd /workspace
git clone https://github.com/ljkrajewski/runpod_ai.git
./runpod_ai/run_me_first.sh
```
8. Click on the project you wish to run and follow its directections.
    - [AUTOMATIC1111/Stable Diffusion (text2image)](#automatic1111stable-diffusion-text2image)
    - [ComfyUI/SDXL (text2image)](#comfyuisdxl-text2image)
    - [bmaltais/kohya_ss (text2image training)](#bmaltaiskohya_ss-text2image-training)
    - [kohya-ss/sd-scripts](#kohya-sssd-scripts-text2image-training)
    - [oobabooga/text-generation-webui (text2text)](#oobaboogatext-generation-webui-text2text)
    - [Honkware/text-generation-webui (text2text)](#honkwaretext-generation-webui-text2text)
## [AUTOMATIC1111/Stable Diffusion](https://github.com/AUTOMATIC1111/stable-diffusion-webui) (text2image)
### Training resources:
- [AMAZING SD Models - And how to get the MOST out of them! (YouTube)](https://www.youtube.com/watch?v=ezNDCWhv4pQ)
### Directions:
1. In Jupyter Notebook, open a new terminal tab and run
   ```
   /workspace/runpod_ai/auto1111.sh
   ```
2. When ... _[Changing the directions to no longer use gradio link]_
## [ComfyUI/SDXL](https://github.com/comfyanonymous/ComfyUI) (text2image)
### Training resources:
- [Scott Detweiler's ComfyUI playlist (YouTube)](https://www.youtube.com/playlist?list=PLIF38owJLhR1EGDY4kOnsEnMyolZgza1x)
IMO, best resource for learning to use ComfyUI from scratch.
- [ComfyUI Tutorial](https://comfyanonymous.github.io/ComfyUI_tutorial_vn/)
- [How To Use ComfyUI On Your PC, On Google Colab (Free) And On RunPod With SDXL Full Tutorial / Guide](https://github.com/FurkanGozukara/Stable-Diffusion/blob/main/Tutorials/How-To-Use-ComfyUI-On-Your-PC-On-RunPod-On-Colab-With-SDXL.md)
- [ComfyUI Master Tutorial - Stable Diffusion XL (SDXL) - Install On PC, Google Colab (Free) & RunPod (YouTube)](https://www.youtube.com/watch?v=FnMHbhvWUhE)
- [ComfyUI Examples](https://comfyanonymous.github.io/ComfyUI_examples/)
Contains examples of what is achievable with ComfyUI. Includes workflows for:
    - [2-pass txt2image](https://comfyanonymous.github.io/ComfyUI_examples/2_pass_txt2img/)
    - [img2img](https://comfyanonymous.github.io/ComfyUI_examples/img2img/)
    - [inpainting](https://comfyanonymous.github.io/ComfyUI_examples/inpaint/)
    - [using LoRAs](https://comfyanonymous.github.io/ComfyUI_examples/lora/)
    - [ControlNet and T2I-Adapter](https://comfyanonymous.github.io/ComfyUI_examples/controlnet/)
    - [Textual Inversion Embeddings](https://comfyanonymous.github.io/ComfyUI_examples/textual_inversion_embeddings/)
- [ComfyUI SDXL Workflow](https://www.patreon.com/posts/comfyui-workflow-86104919)
### Directions:
1. In Jupyter Notebook, open a new terminal tab and run
   ```
   /workspace/runpod_ai/comfyui.sh
   ```
2. When ... _[Changing the directions to no longer use gradio link]_
3. When ComfyUI is running in your web browser, load the default workflow.
## [bmaltais/kohya_ss](https://github.com/bmaltais/kohya_ss) (text2image training)
### Training resources:
- [Tutorial: Dreambooth LoRA training using Kohya_SS (article)](https://civitai.com/articles/391/tutorial-dreambooth-lora-training-using-kohyass)
- [The guide to fine-tuning Stable Diffusion with your own images (article)](https://tryolabs.com/blog/2022/10/25/the-guide-to-fine-tuning-stable-diffusion-with-your-own-images)
- [Training LoRA with Kohya (theory included!) (YouTube)](https://www.youtube.com/watch?v=xholR62Q2tY)
- [LORA + Checkpoint Model Training GUIDE - Get the BEST RESULTS super easy (YouTube)](https://www.youtube.com/watch?v=j-So4VYTL98)
### Directions:
1. In Jupyter Notebook, open a new terminal tab and run:
   ```
   /workspace/runpod_ai/koyha_ss-1.sh
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
