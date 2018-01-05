#!/bin/bash

cd src/

curl -O https://swift.org/builds/swift-3.1-release/ubuntu1604/swift-3.1-RELEASE/swift-3.1-RELEASE-ubuntu16.04.tar.gz

tar zxvf swift-3.1-RELEASE-ubuntu16.04.tar.gz

mv swift-3.1-RELEASE-ubuntu16.04/* .

rm swift-3.1-RELEASE-ubuntu16.04.tar.gz
rm -fr swift-3.1-RELEASE-ubuntu16.04
