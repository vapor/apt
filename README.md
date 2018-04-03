# Vapor APT

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
sudo apt-get install swift vapor
```

## Add package to repository

You can add your own packages or updates to existing packages. To do so, make a PR with the package. To keep the integrity os the repository, we will look through each PR very carefully.

The package should be included in each ubuntu version folder. The folder should be called

`<packageName>_<packageVersion>`

e.g.

`swift_4.1.0`

Inside the folder, you need the following structure

* `src/`
* `build.yaml`

You can optionally add a `postinst` file, a bash script, that should run after install.

### src folder

Here you need to place the sourcecode to be installed. The structure inside the folder, will be replicated on the system, e.g.:

`src/usr/local/bin/test.sh` will move test.sh to `/usr/local/bin/test.sh` on the system

### build.yaml file

This is a Yaml file instructing the system how to build the package.

Example:

```
package: "swift"
version: "3.1.1"

dependencies:
    - "clang"
    - "libicu-dev"
    - "libcurl3"

description: "Swift programming language"

postinst: true
```

From the example:

`package:` The package name it will translate into `apt-get install <package>`

`version:` Package version

`dependencies:` A list of other APT programs the package depends on

`description:` Description of the package (Need to be the same for each version of the same package)

### build.sh

You can include a build.sh file if you need to build the package for the system (e.g. For Toolbox.) include your source code in a `build/` folder, and include a build.sh file that compiles and moves the compiled code to `src/`.

### Folder structure

Inside each ubuntu distribution, there is a folder structure, based on the priority on which they should be built. This is meant so packages can depend on each other. Packages will be built in the priority as shown below.

* Swift - Folder will be built first (Swift, ctls, cmysql)
* Toolbox - Containing the Toolbox
* VaporPackages - Reserved for other Vapor related packages
* OtherPackages - Thirdparty packages not officially supported by Vapor

### Version guide

Basically version need to be semver (x.x.x)

If a toolbox need to work with multiple Swift versions, add additional versions like this:

* 3.1.2 (Toolbox: 3.1.2, Swift: 4.0.0)
* 3.1.2-4.0.2 (Toolbox: 3.1.2, Swift: 4.0.2)
* 3.1.2-4.0.3 (Toolbox: 3.1.2, Swift: 4.0.3)

#### Swift pre release

For Swift beta, the version should be e.g. `4.0.0~20170915` the part after `~` is the release date.

### Examples

Simple package:

[ctls](./16.04/Swift/ctls_1.0.1) - Installs a file called `ctls.pc` in `/usr/local/lib/pkgconfig`

More advanced examples:

[Swift 4.0.0](./16.04/Swift/swift_4.0.0) - Fetches Swift 4.0.0 from swift.org and automatically sets it up in the `src` folder. Also containing `postinst` to change permissions after install.

[Toolbox 3.1.2](./16.04/Toolbox/vapor_3.1.2) - Clones Vapor Toolbox, changes version number, and compiles the toolbox, and adds executable in `src/` folder.
