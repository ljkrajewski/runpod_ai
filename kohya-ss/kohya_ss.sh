#!/usr/bin/env bash

BASE='/workspace'
RPBASE="$BASE/runpod_ai/kohya_ss"
KSSBASE="$BASE/kohya_ss"
TrainingDir="$BASE/training"
INSTALLLOG="$BASE/install.log"

function install_kohya {
  [ ! -d $TrainingDir ] && mkdir -p $TrainingDir
  cd $TrainingDir
  [ ! -f v1-5-pruned.safetensors ] && \
    wget -nv https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors
  #curl https://civitai.com/api/download/models/90072 -o Photon.safetensors -L
  
  cd $KSSBASE
  ./setup-runpod.sh
#  ./gui.sh --share --headless
}

echo "Starting kohya-ss install. To follow the install log, enter:"
echo "    tail -f $INSTALLLOG"
echo "in a different terminal window."
echo

cd $BASE
git clone https://github.com/bmaltais/kohya_ss.git
cd $KSSBASE
python -m venv venv
cd venv
source bin/activate
install_kohya > $INSTALLLOG 2>&1 &

read -p "Token name: " tokenName
read -p "Class:  " className

[ ! -d $TrainingDir/log ] && mkdir -p $TrainingDir/log
[ ! -d $TrainingDir/img/tmp ] && mkdir -p $TrainingDir/img/tmp
[ ! -d $TrainingDir/model ] && mkdir -p $TrainingDir/model
[ ! -d $TrainingDir/reg/tmp ] && mkdir -p $TrainingDir/reg/tmp
echo "Upload your training images to $TrainingDir/img/tmp now."
echo "You can proceed when all training images are uploaded."
read -p "Press <enter> to continue" tmpPause

numTrainingFiles=$((`ls -l $TrainingDir/img/tmp | wc -l` - 1))
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
cd $TrainingDir/img
imgDirName=$numRepeats"_$tokenName $className"
mv tmp "$imgDirName"

numRegFiles=$(($numRepeats * $numTrainingFiles))
echo
echo "You will need at least $numRegFiles regularization images of class $className."
echo "Create your regularization images in Stable Diffusion."
echo "When your regularization images are complete, move them to $TrainingDir/reg/tmp."
echo "You can proceed when the regularization images are moved."
read -p "Press <enter> to continue" tmpPause

cd $TrainingDir/reg
mv tmp "1_$className"

echo
echo "Waiting here until you are able to enter the koyha_ss UI...."
#read -p "Press <enter> to continue" tmpPause

wait

echo
echo "Last few steps..."
echo "1\) Caption your training files."
echo "Captioning directory: $TrainingDir/img/$imgDirName"
echo "BLIP is recommended for phrotorealistic models, WD14 for anime/drawings."
echo "Remember to add '$tokenName' to the captioning prefix along with any other words you wish to train on."
echo
sed "s/TOKENNAME/$tokenName/g" $RPBASE/kohya-ss.conf.orig > $TrainingDir/kohya-ss.conf
sed -i "s/CLASSNAME/$className/g" $TrainingDir/kohya-ss.conf
sed -i "s/TRAININGDIR/$TrainingDir/g" $TrainingDir/kohya-ss.conf
echo "2\) Load the configuration file at $TrainingDir/kohya-ss.conf into kohya-ss."
echo "Confirm your sample prompt, make any other parameter changes you wish to, then begin training."
echo
read -p "Press <enter> to start the kohya-ss GUI." tmpPause

cd $KSSBASE
./gui.sh --listen=0.0.0.0 --headless --server_port 8000
