#!/bin/sh

cd src_eigen
mkdir -p build && cd build
cmake ..
cmake --build .
./OSQP_Eigen_MPC_example