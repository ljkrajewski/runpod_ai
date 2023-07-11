# Text and image creation scripts for RunPod that work<sup>*</sup>
_<sup>*</sup>This is a work in progress, so take the claim that these scripts/notebooks work with a grain of salt._
## Start here:
1. Go to [RunPod.io](https://runpod.io) and log in.
2. Go to _Templates_ and pick the _RunPod Pytorch 2.0.1_ template.
3. Select a pod to start.  
    - 48GB+ VRAM for 13B+ LLMs or hi-res Stable Diffusion pictures.
    - 20GB VRAM for most other uses.
4. Set container size to 50GB, volume size 100GB
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
    - [bmaltais/kohya_ss (text2image training)](#bmaltaiskohya_ss-text2image-training)
    - [oobabooga/text-generation-webui (text2text)](#oobaboogatext-generation-webui-text2text)
    - [Honkware/text-generation-webui (text2text)](#honkwaretext-generation-webui-text2text)
## [AUTOMATIC1111/Stable Diffusion](https://github.com/AUTOMATIC1111/stable-diffusion-webui) (text2image)
### Directions:
1. In Jupyter Notebook, open a new terminal tab and run
   ```
   /workspace/runpod_ai/auto1111.sh
   ```
2. When the "Running on public URL:" line appears, click on the _gradio.live_ link to enter your Automatic 1111 session.
## [bmaltais/kohya_ss](https://github.com/bmaltais/kohya_ss) (text2image training)
### Training resources:
- [The guide to fine-tuning Stable Diffusion with your own images (article)](https://tryolabs.com/blog/2022/10/25/the-guide-to-fine-tuning-stable-diffusion-with-your-own-images)
- [Training LoRA with Kohya (theory included!) (YouTube)](https://www.youtube.com/watch?v=xholR62Q2tY)
- [LORA + Checkpoint Model Training GUIDE - Get the BEST RESULTS super easy (YouTube)](https://www.youtube.com/watch?v=j-So4VYTL98)
### Directions:
1. In Jupyter Notebook, open a new terminal tab and run:
   ```
   /workspace/runpod_ai/koyha_ss-1.sh
   ```
2. Answer the prompts and follow the directions.
## [oobabooga/text-generation-webui](https://github.com/oobabooga/text-generation-webui) (text2text)
_Coming soon_
## [Honkware/text-generation-webui](https://github.com/Honkware/text-generation-webui) (text2text)
_Coming soon_
