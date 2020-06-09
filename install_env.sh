#!/bin/bash

sudo apt-get install gcc g++ build-essential autoconf automake pkg-config libtool

Echo "---------Done Step 1-----------"

if which conda >/dev/null; then
    echo exists
else
    wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
    bash Anaconda3-2020.02-Linux-x86_64.sh 
    rm Anaconda3-2020.02-Linux-x86_64.sh 
fi
echo "---------Done Step 2-----------"

sudo apt-get install yaggo emboss gettext blasr

echo "---------Done Step 3-----------"

sudo apt-get update

echo "---------Done Step 4-----------"

wget https://github.com/gmarcais/Jellyfish/archive/v2.3.0.tar.gz
tar -zxvf v2.3.0.tar.gz 
rm v2.3.0.tar.gz 
echo "---------Done Step 5.1-----------"

cd Jellyfish-2.3.0/
autoreconf -i
./configure
make -j 4
sudo make install

echo "---------Done Step 5.2-----------"

pkg-config --exists jellyfish-2.0 && echo OK

echo "---------Done Step 5.3-----------"
cd ..

echo "---------Done Step 6-----------"
wget https://github.com/gmarcais/Quorum/releases/download/v1.1.1/quorum-1.1.1.tar.gz
tar -zxvf quorum-1.1.1.tar.gz 
rm quorum-1.1.1.tar.gz

echo "---------Done Step 7.1-----------"
cd quorum-1.1.1/
autoreconf -fi
./configure
make
sudo make install 
echo "---------Done Step 7.2-----------"

