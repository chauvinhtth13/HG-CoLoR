#!/bin/bash

sudo apt-get install gcc g++ build-essential autoconf automake autoreconf pkg-config libtool
if which python3 >/dev/null; then
    echo exists
else
    wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
    bash Anaconda3-2020.02-Linux-x86_64.sh 
    rm Anaconda3-2020.02-Linux-x86_64.sh 
fi

sudo apt-get install yaggo emboss

sudo apt-get update
sudo apt-get upgrade

wget https://github.com/gmarcais/Jellyfish/archive/v2.3.0.tar.gz
tar -zxvf v2.3.0.tar.gz 
rm v2.3.0.tar.gz 
cd Jellyfish-2.3.0/
autoreconf -fi
./configure
make -j 4
sudo make install
pkg-config --exists jellyfish-2.0 && echo OK

cd ..

wget https://github.com/gmarcais/Quorum/releases/download/v1.1.1/quorum-1.1.1.tar.gz
tar -zxvf quorum-1.1.1.tar.gz 
rm quorum-1.1.1.tar.gz
cd quorum-1.1.1/
autoreconf -fi
./configure
make
sudo make install
