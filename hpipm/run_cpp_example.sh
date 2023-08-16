#!/bin/sh

cd src_cpp
mkdir -p build && cd build
cmake ..
cmake --build .
./hpipm_cpp_example