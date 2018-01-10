#!/bin/bash

cd src/

wget https://github.com/nodes-vapor/stack/releases/download/0.0.0/stack-linux.tar.gz

tar zxf stack-linux.tar.gz

mv stack-linux/libstack.so usr/local/lib
mv stack-linux/stack.h usr/local/include

rm stack-linux.tar.gz
rm -fr stack-linux
