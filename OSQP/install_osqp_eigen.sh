#!/bin/sh
sudo apt install -y libeigen3-dev

# plz install osqp before build osqp-eigen
git clone https://github.com/robotology/osqp-eigen.git
cd osqp-eigen
mkdir build
cd build
cmake ..
make
sudo make install