#!/bin/bash

# Add the repository
sudo rpm -Uvh http://repo.webtatic.com/yum/centos/5/latest.rpm

# Install the latest version of git
sudo yum install --enablerepo=webtatic git-core
