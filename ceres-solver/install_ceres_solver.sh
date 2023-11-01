#!/bin/sh
sudo apt update
sudo apt install -y cmake git gcc g++
sudo apt install -y libgoogle-glog-dev libgflags-dev
sudo apt install -y libatlas-base-dev
sudo apt install -y libeigen3-dev
sudo apt install -y libsuitesparse-dev

git clone https://ceres-solver.googlesource.com/ceres-solver
cd ceres-solver
mkdir build
cd build
cmake ..
make -j3
sudo make install