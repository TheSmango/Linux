#!/bin/bash

echo "This script is going to try to install cmatrix for your linux workstation"
sleep 5
echo "First let's download the file"
sleep 1
sudo wget https://www.asty.org/cmatrix2/dist/cmatrix-1.2a.tar.gz
sleep 2
echo "Now let's unpack the tar file"
sudo tar xvzf cmatrix-1.2a.tar.gz
sleep 1
echo "We are switching directories now"
sleep 3
cd cmatrix-1.2a
echo "Now to make our file"
sleep 3
aclocal
autoconf
automake -a
./configure
make
sudo make install
sleep 3
echo "Now you should be able to run cmatrix in your terminal and visit the matrix"
sleep 5
