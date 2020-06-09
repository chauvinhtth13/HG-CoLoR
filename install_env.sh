#!/bin/bash

sudo apt-get install gcc g++ build-essential autoconf automake pkg-config libtool gettext
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

