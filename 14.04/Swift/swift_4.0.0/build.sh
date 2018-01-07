#!/bin/bash

SWIFT_VERSION="4.0-release"
SWIFT_VERSION2="$(tr [a-z] [A-Z] <<< "$SWIFT_VERSION")"
UBUNTU_VERSION="ubuntu14.04"
UBUNTU_VERSION2="ubuntu1404"

cd src/

curl -O https://swift.org/builds/swift-$SWIFT_VERSION/$UBUNTU_VERSION2/swift-$SWIFT_VERSION2/swift-$SWIFT_VERSION2-$UBUNTU_VERSION.tar.gz

tar zxf swift-$SWIFT_VERSION2-$UBUNTU_VERSION.tar.gz

mv swift-$SWIFT_VERSION2-$UBUNTU_VERSION/* .

rm swift-$SWIFT_VERSION2-$UBUNTU_VERSION.tar.gz
rm -fr swift-$SWIFT_VERSION2-$UBUNTU_VERSION
