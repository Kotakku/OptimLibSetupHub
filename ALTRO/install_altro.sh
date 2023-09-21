#!/bin/sh

current_dir=$(pwd)

sudo add-apt-repository universe
sudo apt update
sudo apt install -y git gcc g++ libeigen3-dev libfmt-dev

git clone https://github.com/bjack205/altro
cd altro
mkdir build
cd build
cmake -DALTRO_BUILD_TESTS=OFF -DBUILD_SHARED_LIBS=ON -DALTRO_ENABLE_ARDUINO_LIB_INSTALL=OFF -DCMAKE_INSTALL_PREFIX=/usr/local ..
cmake --build . -j4
sudo make install

cd $current_dir

git clone https://github.com/bjack205/altro-cpp
cd altro-cpp
mkdir build
cd build
cmake -DALTRO_BUILD_TESTS=OFF -DALTRO_BUILD_EXAMPLES=OFF -DALTRO_BUILD_BENCHMARKS=OFF -DALTRO_BUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/usr/local ..
cmake --build . -j4
sudo make install

cd $current_dir

sudo ldconfig