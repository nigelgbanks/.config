#!/bin/bash

# First make sure what we have is the latest.
sudo apt-get update
sudo apt-get upgrade

# Get the most recent version of git.
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git
