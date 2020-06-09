#!/bin/bash

git submodule init
git submodule update
cd KMC/
make -j
cd ../PgSA/
make build CONF=pgsalib
make build CONF=pgsagen
cd ..
make

export PATH=$PATH:$PWD/KMC/bin:$PWD/PgSA/dist/pgsagen/GNU-Linux-x86/
