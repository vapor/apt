#!/bin/bash

TOOLBOX_VERSION="3.1.2"
SWIFT_VERSION="4.0.2"

apt-get update -y
apt-get install -y --allow-downgrades swift=${SWIFT_VERSION} ctls

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
