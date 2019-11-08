#!/bin/bash

tar -xzf go1.13.4.linux-amd64.tar.gz

if [ -d "/usr/local/go" ]; then sudo rm -rf /usr/local/go; fi
sudo mv go /usr/local

[ ! -d $HOME/GoProjects ] && sudo mkdir -p $HOME/GoProjects

echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
echo 'export GOPATH=$HOME/GoProjects' >> ~/.bash_profile
echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> ~/.bash_profile

source ~/.bash_profile

# Verify installation
go version

# Verify all configured environment variables
go env

