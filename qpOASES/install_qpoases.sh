#!/bin/sh
sudo apt install -y make g++ git
git clone https://github.com/coin-or/qpOASES.git
cd qpOASES
mkdir -p build && cd build
cmake ..
make
sudo make install