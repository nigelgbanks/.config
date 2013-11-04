#!/bin/bash
# This is for shared DGI dev boxes in which I want to create my own user for.
echo "Creating User 'nbanks'";
sudo useradd -d /home/nbanks -m nbanks
sudo passwd nbanks
sudo usermod -a -G www-data nbanks 2> /dev/null
sudo usermod -a -G fedora nbanks 2> /dev/null
sudo usermod -a -G dgi nbanks 2> /dev/null
sudo usermod -a -G dev nbanks 2> /dev/null
sudo usermod -a -G developers nbanks 2> /dev/null
# Pull down my config files.
su -l nbanks
git clone git@github.com:nigelgbanks/.config.git
