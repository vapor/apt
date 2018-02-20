#!/bin/bash

TOOLBOX_VERSION="3.1.4"
SWIFT_VERSION="4.1.0~20180218"

apt-get update -y
apt-get remove -y swift
apt-get install -y --allow-downgrades swift-beta=${SWIFT_VERSION} ctls

swift --version

git clone git@github.com:vapor/toolbox.git && cd toolbox

git checkout $TOOLBOX_VERSION

sed -i "s/let version = \".*\"/let version = \"${TOOLBOX_VERSION}\"/" Sources/Executable/main.swift

swift build -c release

git branch

.build/release/Executable version

cd ..

mkdir -p src/usr/local/bin

mv toolbox/.build/release/Executable src/usr/local/bin/vapor

rm -fr toolbox

apt-get install -y swift
