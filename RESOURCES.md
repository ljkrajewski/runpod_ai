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
- Styles
  - [Stable Diffusion 1.5 - Style Cheat Sheet](https://supagruen.github.io/StableDiffusion-CheatSheet/)  
A collection of what Stable Diffusion imagines these artists' styles look like.
  - [Prompt Styles by Sebastian, Hili & Maui](https://www.patreon.com/posts/sebs-hilis-79649068)  
Put this file (styles.csv) in your stable-diffusion-webui root folder.

----

- Google: [Carbon Canister 2007 Toyota Sienna](https://www.google.com/search?q=Carbon+Canister+2007+Toyota+Sienna)
- PartsGeek: [Carbon Canister - 2007-2010 Toyota Sienna - Standard Motor Products](https://www.partsgeek.com/kx8chkt-toyota-sienna-carbon-canister.html?utm_source=google&utm_medium=ff&utm_content=DN&utm_campaign=PartsGeek+Google+Base&utm_term=2007-2010+Toyota+Sienna+Carbon+Canister+Standard+Motor+Products+CP3396+07-10+Toyota+Carbon+Canister+2009+2008&fp=pp&gbm=a&cid=18313611776&gclid=Cj0KCQjwxuCnBhDLARIsAB-cq1raEqm7vTH2RdJlQl0YhyTixo8MlnxCX8tKSOfH1XvXZTYeJG42zeAaAkDiEALw_wcB)  
- EBay: [2006-2010 TOYOTA SIENNA 3.5L FUEL VAPOR CHARCOAL CANISTER 77740-08060 OEM](https://www.ebay.com/itm/386067966351?chn=ps&_trkparms=ispr%3D1&amdata=enc%3A1SvZLdHo5TBiF2LJoyFVYuA65&norover=1&mkevt=1&mkrid=711-117182-37290-0&mkcid=2&mkscid=101&itemid=386067966351&targetid=1644837434363&device=c&mktype=pla&googleloc=9007525&poi=&campaignid=20391901918&mkgroupid=154020128120&rlsatarget=pla-1644837434363&abcId=9316955&merchantid=427087022&gclid=Cj0KCQjwxuCnBhDLARIsAB-cq1ozyCPlJOG9VYOSNz9TrhsHUqXjeIeuz73mK-AntOE86lSnIraS48saAiMrEALw_wcB)
