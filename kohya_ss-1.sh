#!/usr/bin/env bash

read -p "Token name: " tokenName
read -p "Class:  " className

[ ! -d /workspace/training/log ] && mkdir -p /workspace/training/log
[ ! -d /workspace/training/img/tmp ] && mkdir -p /workspace/training/img/tmp
[ ! -d /workspace/training/model ] && mkdir -p /workspace/training/model
[ ! -d /workspace/training/reg/tmp ] && mkdir -p /workspace/training/reg/tmp
echo "Upload your training images to /workspace/training/img/tmp now."
echo "You can proceed when all training images are uploaded."
read -p "Press <enter> to continue" tmpPause

numTrainingFiles=$((`ls -l /workspace/training/img/tmp | wc -l` - 1))
#for LoRA training, btw 1500-6000 steps per epoch
minRecRepeats=$(((1500/$numTrainingFiles)+1))
if [[ "$minRecRepeats" -lt "10" ]]; then
  minRecRepeats=10
fi
maxRecRepeats=$(((6000/$numTrainingFiles)+1))
if [[ "$maxRecRepeats" -lt "10" ]]; then
  maxRecRepeats=10
fi
echo
echo "Recommended number of repeats is between $minRecRepeats and $maxRecRepeats per image."
echo "Note: Easy subjects like faces can use fewer repeats."
read -p "Enter number of repeats per image:  " numRepeats
cd /workspace/training/img
imgDirName=$numRepeats"_$tokenName $className"
mv tmp "$imgDirName"

numRegFiles=$(($numRepeats * $numTrainingFiles))
echo
echo "You will need at least $numRegFiles regularization images of class $className."
echo "Run /workspace/runpod_ai/auto1111.sh in a new terminal to install and run AUTOMATIC1111/Stable Diffusion to create your regularization images."
echo "In another terminal, run /workspace/runpod_ai/kohya_ss-2.sh to install and run kohya_ss."
echo "When your regularization images are complete, move them to /workspace/training/reg/tmp."
echo "You can proceed when the regularization images are moved."
read -p "Press <enter> to continue" tmpPause

cd /workspace/training/reg
mv tmp "1_$className"

echo
echo "Wait here until you are able to enter the koyha_ss UI."
read -p "Press <enter> to continue" tmpPause

echo
echo "Last few steps..."
echo "1\) Caption your training files."
echo "Captioning directory: /workspace/training/img/$imgDirName"
echo "BLIP is recommended for phrotorealistic models, WD14 for anime/drawings."
echo "Remember to add '$tokenName' to the captioning prefix along with any other words you wish to train on."
echo
sed "s/TOKENNAME/$tokenName/g" /workspace/runpod_ai/settings/kohya-ss.conf.orig > /workspace/kohya-ss.conf
sed -i "s/CLASSNAME/$className/g" /workspace/kohya-ss.conf
echo "2\) Load the configuration file at /workspace/kohya-ss.conf into hohya-ss."
echo "Confirm your sample prompt, make any other parameter changes you wish to, then begin training."

