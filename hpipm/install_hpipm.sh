#!/bin/sh
sudo apt-get install -y cmake gcc g++ git
git clone https://github.com/giaf/blasfeo.git
cd blasfeo
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DBLASFEO_EXAMPLES=OFF 
make -j
sudo make install

cd ../../
git clone https://github.com/giaf/hpipm
cd hpipm
mkdir -p build && cd build
make static_library -j && sudo make install_static
cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DHPIPM_TESTING=OFF 
make -j
sudo make install

export LD_LIBRARY_PATH=/opt/blasfeo/lib:/opt/hpipm/lib:$LD_LIBRARY_PATH