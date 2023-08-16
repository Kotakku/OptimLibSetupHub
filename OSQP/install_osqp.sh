#!/bin/sh
sudo apt install -y cmake gcc g++ git
git clone --recursive https://github.com/osqp/osqp
cd osqp
mkdir -p build && cd build
cmake ..
make
sudo make install