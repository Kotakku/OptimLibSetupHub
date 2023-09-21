#!/bin/sh

cd src
mkdir -p build && cd build
cmake ..
cmake --build .
./casadi_example