#!/bin/sh

sudo apt update
sudo apt install -y git cmake gcc g++ libblas-dev libopenblas-dev gfortran 
git clone https://github.com/acados/acados.git
cd acados
git submodule update --recursive --init
mkdir -p build
cd build
export ACADOS_INSTALL_DIR=/usr/local
export ACADOS_INCLUDE_DIRS="${ACADOS_INSTALL_DIR}/include;${ACADOS_INSTALL_DIR}/include/blasfeo/include;${ACADOS_INSTALL_DIR}/include/hpipm/include;${ACADOS_INSTALL_DIR}/include/daqp"
cmake -DACADOS_SILENT=ON -DACADOS_WITH_QPOASES=ON -DACADOS_WITH_OSQP=ON -DACADOS_WITH_HPMPC=OFF -DACADOS_EXAMPLES=ON -DACADOS_PYTHON=ON -DACADOS_INSTALL_DIR=/usr/local ..
make -j4
sudo make install

echo "export ACADOS_INSTALL_DIR=\"$ACADOS_INSTALL_DIR\"" >> ~/.bashrc
echo "export ACADOS_INCLUDE_DIRS=\"$ACADOS_INCLUDE_DIRS\"" >> ~/.bashrc
source ~/.bashrc