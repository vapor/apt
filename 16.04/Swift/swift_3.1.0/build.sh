#!/bin/bash

SWIFT_VERSION="3.1-release"
SWIFT_VERSION2="$(tr [a-z] [A-Z] <<< "$SWIFT_VERSION")"
UBUNTU_VERSION="ubuntu16.04"
UBUNTU_VERSION2="ubuntu1604"

cd src/

echo "https://swift.org/builds/swift-$SWIFT_VERSION/$UBUNTU_VERSION2/swift-$SWIFT_VERSION2/swift-$SWIFT_VERSION2-$UBUNTU_VERSION.tar.gz"

curl -O https://swift.org/builds/swift-$SWIFT_VERSION/$UBUNTU_VERSION2/swift-$SWIFT_VERSION2/swift-$SWIFT_VERSION2-$UBUNTU_VERSION.tar.gz

tar zxvf swift-$SWIFT_VERSION2-$UBUNTU_VERSION.tar.gz

cp -R swift-$SWIFT_VERSION2-$UBUNTU_VERSION/* .

rm swift-$SWIFT_VERSION2-$UBUNTU_VERSION.tar.gz
rm -fr swift-$SWIFT_VERSION2-$UBUNTU_VERSION
