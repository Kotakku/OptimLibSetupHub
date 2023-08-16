#!/bin/sh

cd src
mkdir -p build && cd build
cmake ..
cmake --build .
./ipopt_example