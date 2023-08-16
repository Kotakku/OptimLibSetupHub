#!/bin/sh
# plz run install_hpipm.sh first
sudo apt install -y libeigen3-dev
git clone https://github.com/mayataka/hpipm-cpp
cd hpipm-cpp
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release 
make -j
sudo make install