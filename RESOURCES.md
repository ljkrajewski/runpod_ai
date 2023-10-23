# Misc tips/tools
## Table of Contents
- [Preparing your RunPod instance for development using git and github](#preparing-your-runpod-instance-for-development-using-git-and-github)
- [Useful sites](#useful-sites)
## Preparing your RunPod instance for development using git and github
1. Go to https://github.com/settings/keys and delete the old "Temp runpod key" public key.
2. In your Runpod terminal, run the following commands.
```
apt update
cd ~
ssh-keygen -t ed25519 -f .ssh/runpod -C "Temp runpod key"
cat .ssh/runpod.pub
```
3. Copy the public key generated above to https://github.com/settings/ssh/new.
4. In your Runpod terminal, run the next block of commands replacing _Your Name_ and _<nolink>your.email.address<span>@example.com_ with your name and email address respectively. If desired, change the code branch from _dev_ to whichever branch you wish to work on.
```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/runpod
git config --global user.name "Your Name"
git config --global user.email your.email.address@example.com
cd /workspace
git clone git@github.com:ljkrajewski/runpod_ai.git
cd runpod_ai
git checkout dev
./run_me_first.sh
```
## Useful sites
- [EXIF Data Viewer Online - Photo Location Viewer](https://linangdata.com/exif-reader/)  
This online EXIF Viewer lets you view the data in your photos and the location where the photo was taken.
- [AI Image Upscaling - Auto Enlarge Image Online](https://www.avaide.com/image-upscaler/)  
Effective image upscaling/enhancement 
- [BIRME - Bulk Image Resizing Made Easy 2.0](https://www.birme.net/?target_width=512&target_height=512)  
Free bulk resizer/cropper
- [ComfyUI extention tutorials](https://github.com/ltdrdata/ComfyUI-extension-tutorials/tree/Main)  
Includes tutorials for [Impact Pack](https://github.com/ltdrdata/ComfyUI-Impact-Pack), [Inspire Pack](https://github.com/ltdrdata/ComfyUI-Inspire-Pack), and [Workflow Component](https://github.com/ltdrdata/ComfyUI-Workflow-Component).
- Styles
  - [Stable Diffusion 1.5 - Style Cheat Sheet](https://supagruen.github.io/StableDiffusion-CheatSheet/)  
A collection of what Stable Diffusion imagines these artists' styles look like.
  - [Prompt Styles by Sebastian, Hili & Maui](https://www.patreon.com/posts/sebs-hilis-79649068)  
Put this file (styles.csv) in your stable-diffusion-webui root folder.
  - [Pika Labs](https://www.pika.art/)
Text-to-video platform.
