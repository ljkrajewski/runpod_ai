#!/usr/bin/env bash

BASE='/workplace'
RPBASE="$BASE/runpod_ai/kohya_ss"
KSSBASE="$BASE/kohya_ss"
TRAININGDIR="$BASE/training"

read -p "Token name: " tokenName
read -p "Class:  " className

[ ! -d $TRAININGDIR/log ] && mkdir -p $TRAININGDIR/log
[ ! -d $TRAININGDIR/img/tmp ] && mkdir -p $TRAININGDIR/img/tmp
[ ! -d $TRAININGDIR/model ] && mkdir -p $TRAININGDIR/model
[ ! -d $TRAININGDIR/reg/tmp ] && mkdir -p $TRAININGDIR/reg/tmp
echo "Upload your training images to $TRAININGDIR/img/tmp now."
echo "You can proceed when all training images are uploaded."
read -p "Press <enter> to continue" tmpPause

numTrainingFiles=$((`ls -l $TRAININGDIR/img/tmp | wc -l` - 1))
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
cd $TRAININGDIR/img
imgDirName=$numRepeats"_$tokenName $className"
mv tmp "$imgDirName"

numRegFiles=$(($numRepeats * $numTrainingFiles))
echo
echo "You will need at least $numRegFiles regularization images of class $className."
echo "Create your regularization images in Stable Diffusion."
echo "In another terminal, run $RPBASE/kohya_ss-2.sh to install and run kohya_ss."
echo "When your regularization images are complete, move them to $TRAININGDIR/reg/tmp."
echo "You can proceed when the regularization images are moved."
read -p "Press <enter> to continue" tmpPause

cd $TRAININGDIR/reg
mv tmp "1_$className"

echo
echo "Wait here until you are able to enter the koyha_ss UI."
read -p "Press <enter> to continue" tmpPause

echo
echo "Last few steps..."
echo "1\) Caption your training files."
echo "Captioning directory: $TRAININGDIR/img/$imgDirName"
echo "BLIP is recommended for phrotorealistic models, WD14 for anime/drawings."
echo "Remember to add '$tokenName' to the captioning prefix along with any other words you wish to train on."
echo
sed "s/TOKENNAME/$tokenName/g" $RPBASE/kohya-ss.conf.orig > $TRAININGDIR/kohya-ss.conf
sed -i "s/CLASSNAME/$className/g" $TRAININGDIR/kohya-ss.conf
sed -i "s/TRAININGDIR/$TRAININGDIR/g" $TRAININGDIR/kohya-ss.conf
echo "2\) Load the configuration file at $TRAININGDIR/kohya-ss.conf into kohya-ss."
echo "Confirm your sample prompt, make any other parameter changes you wish to, then begin training."

