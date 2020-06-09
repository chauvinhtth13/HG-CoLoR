#!/bin/bash

sudo apt-get install gcc g++ build-essential autoconf automake autoreconf pkg-config libtool
cd ..
if which python3 >/dev/null; then
    echo exists
else
    wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
    bash Anaconda3-2020.02-Linux-x86_64.sh 
    rm Anaconda3-2020.02-Linux-x86_64.sh 
fi

sudo apt-get install yaggo emboss

sudo apt-get update

git clone https://github.com/gmarcais/Jellyfish.git
git clone https://github.com/gmarcais/Quorum.git

