# # Vapor APT

[![Build Status](https://jenkins.vapor.cloud/buildStatus/icon?job=vapor-apt-build)](https://jenkins.vapor.cloud/job/vapor-apt-build)

The Vapor APT is the easiest way to install Swift and related packages on Ubuntu. This repository is not limited to Vapor, but can be used to install a standalone Swift.

## Using the APT

To setup the repository on your Ubuntu. Follow the guides below

Install pre dependencies

```
sudo apt-get install software-properties-common python-software-properties
```

Import verification key

```
wget -q https://repo.vapor.codes/apt/keyring.gpg -O- | sudo apt-key add -
```

Add the repository

```
echo "deb https://repo.vapor.codes/apt $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/vapor.list
```

Update your APT

```
sudo apt-get update
```

Install Swift and Vapor

```
sudo apt-get install swiftlang vapor
```

## Add new version to repository

If you want to add a new version to the repository, update the JSON files to reflect.

One important note, is when taking the URL from swift.org, replace the occurances of the distribution with `#DIST`

e.g.

```
https://swift.org/builds/swift-4.2.1-release/ubuntu1604/swift-4.2.1-RELEASE/swift-4.2.1-RELEASE-ubuntu16.04.tar.gz
```

Should be:

```
https://swift.org/builds/swift-4.2.1-release/#DIST/swift-4.2.1-RELEASE/swift-4.2.1-RELEASE-#DIST.tar.gz
```

This allows for copying a file to a new distribution without making changes.

### Pre release

For a Swift prelease, set the version to `VERSION~DATE`

and set `packageName` to `swiftlang-dev`
