#!/bin/bash

# Download Git
if ! hash git 2>/dev/null; then
    open http://git-scm.com/download/mac
fi

# Download Ports
if ! hash port 2>/dev/null; then
    open http://www.macports.org/install.php
fi

# Require Mac Ports to continue.
hash port 2>/dev/null || { echo >&2 "I require Mac Ports (port) but it's not installed. Aborting."; exit 1; }
