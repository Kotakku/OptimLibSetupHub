#!/bin/sh
sudo apt install libblas3 libblas-dev liblapack3 liblapack-dev gfortran -y
sudo apt install libblas-dev liblapack-dev libmetis-dev git -y

# download & unzip coinhsl-YYYY.MM.DD.zip
# rename folder to coinhsl from unzip coinhsl-YYYY.MM.DD

git clone https://github.com/coin-or-tools/ThirdParty-HSL
cd ThirdParty-HSL

# copy coinhsl folder into ThirdParty-HSL
mv

./configure --prefix /usr/local/coinhsl
make
sudo make install

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/coinhsl/lib