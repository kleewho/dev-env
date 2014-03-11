dev-env cookbook
================

Simple cookbook to kickstart newcomers to the project

Usage
-----

download [`dev-env.json`](https://github.com/kleewho/dev-env/releases/download/v0.1.0/dev-env.json) modify it as suitable

download [`run.sh`](from https://github.com/kleewho/dev-env/releases/download/v0.1.0/run.sh) make executable and run, e.g:

    sudo ./run.sh -r https://github.com/kleewho/dev-env/releases/download/v0.1.0/package.tgz


Supported platforms
-------------------
- ubuntu

What it do?
-----------

It installs:
* jdk
* maven
* vagrant
* virtualbox
* git
* ruby with bundler
* intellij idea

Dependencies
------------

Cookbooks:
* java
* maven
* git
* virtualbox
* idea
