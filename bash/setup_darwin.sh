#!/bin/bash

# Download Git, user will have to install manually
if ! hash git 2>/dev/null; then
    open http://git-scm.com/download/mac
fi

# Download Ports, user will have to install manually
if ! hash port 2>/dev/null; then
    open http://www.macports.org/install.php
fi

# Require Mac Ports to continue.
hash port 2>/dev/null || { echo >&2 "I require Mac Ports (port) but it's not installed. Aborting."; exit 1; }

# Grab some of my favorite commands.
sudo port install wget
