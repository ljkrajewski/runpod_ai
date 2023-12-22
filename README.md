# Text and image creation scripts for RunPod that work<sup>*</sup>
_<sup>*</sup>This is a work in progress, so take the claim that these scripts/notebooks work with a grain of salt._
## Start here:
1. Go to [RunPod.io](https://runpod.io) and log in.
2. Go to _Templates_ and pick the _RunPod Pytorch 2.0.1_ template.
3. Select a pod to start.  
    - 48GB+ VRAM for 13B+ LLMs or hi-res Stable Diffusion pictures.
    - 20GB VRAM for most other uses.
4. Set the following customizations:
   - Container size: 65GB for Ollama, 20GB for everything else
   - Volume size: 150GB
   - HTTP service ports: 8888, 3000, 7860, 8000
   - TCP service ports: 11434 for Ollama
5. Start the pod instance.
6. Once RunPod instance has finished booting up, open a terminal either in Jupyter Notebook or through an SSH connection.
7. Inside the terminal, run the following commands:
```
cd /workspace
git clone https://github.com/ljkrajewski/runpod_ai.git
/workspace/runpod_ai/run_me_first.sh
```
8. Select the project you wish to run and follow its directections.
    - **Text-to-image**
      - Stable Diffusion (AUTOMATIC1111, ComfyUI)  
_See sd/README.md_
      - Stable Diffusion XL (ComfyUI-XL)  
_See sdxl/README.md_  
    - **Text-to-image training**
      - LoRA (kohya_ss)
_See kohya-ss/README.md_
      - Textual Inversion/Embeddings  
Currently done in AUTOMATIC1111. _See sd/README.md_
      - Checkpoints  
Coming soon.
    - **Text generation**  
Coming soon. _See textgen/README.md_ 
