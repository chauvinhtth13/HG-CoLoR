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

export PATH=$PWD/KMC/bin/:$PATH
export PATH=$PWD/bin/:$PATH
export PATH=$PWD/PgSA/dist/pgsagen/GNU-Linux-x86/:$PATH
