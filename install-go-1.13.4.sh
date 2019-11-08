#!/bin/bash

tar -xzf go1.13.4.linux-amd64.tar.gz

if [ -d "/usr/local/go" ]; then sudo rm -rf /usr/local/go; fi
sudo mv go /usr/local

[ ! -d $HOME/GoProjects ] && sudo mkdir -p $HOME/GoProjects

export GOROOT=/usr/local/go
export GOPATH=$HOME/GoProjects
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Verify installation
go version

# Verify all configured environment variables
go env

