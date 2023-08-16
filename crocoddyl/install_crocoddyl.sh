#!/bin/sh
sudo apt install -y \
    libeigen3-dev \
    curl \
    lsb-release

sudo apt install -y \
    pkg-config \
    coinor-libipopt-dev \
    gcc \
    g++

sudo echo "deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub $(lsb_release -sc) robotpkg" >> /etc/apt/sources.list.d/robotpkg.list

curl http://robotpkg.openrobots.org/packages/debian/robotpkg.key | sudo apt-key add -
sudo apt update

sudo apt install robotpkg-py3\*-crocoddyl -y

# export PATH=/opt/openrobots/bin:$PATH
# export PKG_CONFIG_PATH=/opt/openrobots/lib/pkgconfig:$PKG_CONFIG_PATH
# export LD_LIBRARY_PATH=/opt/openrobots/lib:$LD_LIBRARY_PATH
# export PYTHONPATH=/opt/openrobots/lib/python3.10/site-packages:$PYTHONPATH

echo "export PATH=/opt/openrobots/bin:$PATH" >> ~/.bashrc
echo "export PKG_CONFIG_PATH=/opt/openrobots/lib/pkgconfig:$PKG_CONFIG_PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/opt/openrobots/lib:$LD_LIBRARY_PATH" >> ~/.bashrc
echo "export PYTHONPATH=/opt/openrobots/lib/python3.10/site-packages:$PYTHONPATH" >> ~/.bashrc