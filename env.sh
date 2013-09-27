#!/bin/bash

# Enviroment Variables that shouldn't be stored in git.
#===============================================================================
source $HOME/.env.sh

# Getting OS Information
#===============================================================================
if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    DIST=$DISTRIB_ID
    DIST_VER=$DISTRIB_RELEASE
else
    DIST="Unknown"
    DIST_VER="Unknown"
fi
if [ -f /etc/debian_version ]; then
    OS="Debian"
    VER=$(cat /etc/debian_version)
elif [ -f /etc/redhat-release ]; then
    OS="Red Hat"
    VER=$(cat /etc/redhat-release)
elif [ -f /etc/SuSE-release ]; then
    OS="SuSE"
    VER=$(cat /etc/SuSE-release)
else
    OS=$(uname -s)
    VER=$(uname -r)
fi

# Global Directories
#===============================================================================
CONFIG=$HOME/.config

# Global Settings
#===============================================================================


# Platform Specific Directories
#===============================================================================
case $OS in

"Darwin")
    DOWNLOADS=$HOME/Downloads
    PROJECTS=$HOME/Projects
    TMP=$HOME/Temporary
    ;;
"Debian")
    DOWNLOADS=$HOME/downloads
    PROJECTS=$HOME/projects
    TMP=$HOME/tmp
    ;;
"Red Hat")
    DOWNLOADS=$HOME/downloads
    PROJECTS=$HOME/projects
    TMP=$HOME/tmp
    ;;
esac

# System Specific
#===============================================================================
case $HOST in

"hal.local")
    PATH=$PATH:$HOME/Library/Haskell/bin
    ;;

"dev.local")
    PATH=$PATH:$HOME/bin
    ;;
esac
