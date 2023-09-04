#!/bin/sh
sudo apt install -y git cmake gcc g++ gfortran pkg-config liblapack-dev pkg-config coinor-libipopt-dev --install-recommends
git clone https://github.com/casadi/casadi.git casadi
# echo "export CMAKE_PREFIX_PATH="$CMAKE_PREFIX_PATH:$HOME/local/:/opt/hpipm/cmake"" >> ~/.bashrc
echo "export CMAKE_PREFIX_PATH="$CMAKE_PREFIX_PATH:$HOME/local/"" >> ~/.bashrc
source ~/.bashrc
cd casadi
mkdir build
cd build

cmake .. -DCMAKE_BUILD_TYPE=Release -DWITH_IPOPT=ON -DWITH_QPOASES=ON 
make -j4
sudo make install

# ## 一発で入れ用とするとなぜかHPIPMのビルドでコケる
# # HPIPMのためにBLASFEOが必要
# cmake .. -DCMAKE_BUILD_TYPE=Release -DWITH_BLASFEO=ON -DWITH_BUILD_BLASFEO=ON
# make -j4
# sudo make install

# # IPOPTとHPIPMを追加
# cmake .. -DCMAKE_BUILD_TYPE=Release -DWITH_IPOPT=ON -DWITH_HPIPM=ON -DWITH_BLASFEO=ON -DWITH_BUILD_HPIPM=ON -DWITH_BUILD_BLASFEO=ON -DWITH_LAPACK=ON -DWITH_QPOASES=ON 
# make -j4
# sudo make install