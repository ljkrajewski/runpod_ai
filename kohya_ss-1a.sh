#!/usr/bin/env bash

read -p "Token name: " tokenName
read -p "Class:  " className

mkdir -p /workspace/training/log
mkdir -p /workspace/training/img/tmp
mkdir -p /workspace/training/model
mkdir -p /workspace/training/reg/tmp
echo "Upload your training images to /workspace/training/img/tmp now."
pause

numTrainingFiles=$((`ls -l /workspace/training/img/tmp | wc -l` - 1))
#for LoRA training, btw 1500-6000 steps total
minRecRepeats=1500/$numTrainingFiles+1
if [[ $minRecRepeats -lt 10 ]]; then
  minRecRepeats=10
fi
maxRecRepeats=6000/$numTrainingFiles+1
if [[ $maxRecRepeats -lt 10 ]]; then
  maxRecRepeats=10
fi
echo "Recommended number of repeats is between $minRecRepeats and $maxRecRepeats per image."
echo "Note: Easy subjects like faces can use fewer repeats."
read -p "Number of repeats per image:  " numRepeats
cd mkdir -p /workspace/training/img
mv tmp "$numRepeats_$tokenName $className"

echo "Will need at least $($numRepeats * $numTrainingFiles) regularization images of class $className."
echo "Run /workspace/runpod_ai/auto1111.sh in a new terminal to install and run AUTOMATIC1111/Stable Diffusion to create your regularization images."
echo "In another terminal, run /workspace/runpod_ai/kohya_ss-2.sh to install and run kohya_ss.
echo "When your regularization images are complete, move them to /workspace/training/reg/tmp now."
pause

cd mkdir -p /workspace/training/reg
mv tmp "1_$className"

sed 's/TOKEN-NAME/$tokenName/g' /workspace/runpod_ai/kohya-ss.conf.orig > /workspace/kohya-ss.conf
echo "Load configuration file /workspace/kohya-ss.conf into hohya-ss."
echo "Confirm your sample prompt, make any other parameter changes you wish to, then begin training."

