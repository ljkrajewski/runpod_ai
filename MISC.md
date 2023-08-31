# Misc tips/tools
## Preparing your RunPod instance for development using git and github
1. Go to https://github.com/settings/keys and delete the old "Temp runpod key" public key.
2. Run the following commands.
```
apt update
cd ~
ssh-keygen -t ed25519 -f .ssh/runpod -C "Temp runpod key"
cat .ssh/runpod.pub
```
3. Copy the public key above to https://github.com/settings/ssh/new.
4. Run the next block of commands replacing _Your Name_ and _<nolink>your.email.address<span>@example.com_ with your name and email address respectively.
```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/runpod
git config --global user.name "Your Name"
git config --global user.email your.email.address@example.com
cd /workspace
git clone git@github.com:ljkrajewski/runpod_ai.git
```
## Useful sites
- [EXIF Data Viewer Online - Photo Location Viewer](https://linangdata.com/exif-reader/)  
This online EXIF Viewer lets you view the data in your photos and the location where the photo was taken.
- [AI Image Upscaling - Auto Enlarge Image Online](https://www.avaide.com/image-upscaler/)  
Effective image upscaling/enhancement 
- [BIRME - Bulk Image Resizing Made Easy 2.0](https://www.birme.net/?target_width=512&target_height=512)  
Free bulk resizer/cropper
- Styles
  - [Stable Diffusion 1.5 - Style Cheat Sheet](https://supagruen.github.io/StableDiffusion-CheatSheet/)  
A collection of what Stable Diffusion imagines these artists' styles look like.
  - [Prompt Styles by Sebastian, Hili & Maui](https://www.patreon.com/posts/sebs-hilis-79649068)  
Put this file (styles.csv) in your stable-diffusion-webui root folder.
