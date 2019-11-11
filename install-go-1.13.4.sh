#!/bin/bash

tar -xzf go1.13.4.linux-amd64.tar.gz

[ ! -d "/usr/local/go" ] && sudo mv go /usr/local

sudo chmod -R 777 /usr/local/go/src
sudo chmod -R 777 /usr/local/go/bin

[ ! -d $HOME/GoProjects ] && sudo mkdir -p $HOME/GoProjects

sudo chmod -R -v 777 $HOME/GoProjects

echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
echo 'export GOPATH=$HOME/GoProjects' >> ~/.bash_profile
echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> ~/.bash_profile

source ~/.bash_profile

# Verify installation
go version

# Verify all configured environment variables
go env

