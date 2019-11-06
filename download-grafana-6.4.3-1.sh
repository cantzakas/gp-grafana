#!/bin/bash

# Get grafana-server depencencies
wget http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/g/gsmartcontrol-1.1.3-1.el7.x86_64.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/libXmu-1.1.2-2.el7.x86_64.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/libXt-1.1.5-3.el7.x86_64.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/libXxf86misc-1.0.3-7.1.el7.x86_64.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-base35-bookman-fonts-20170801-10.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-base35-c059-fonts-20170801-10.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-base35-d050000l-fonts-20170801-10.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-base35-fonts-20170801-10.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-base35-fonts-common-20170801-10.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-base35-gothic-fonts-20170801-10.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-base35-nimbus-mono-ps-fonts-20170801-10.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-base35-nimbus-roman-fonts-20170801-10.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-base35-nimbus-sans-fonts-20170801-10.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-base35-p052-fonts-20170801-10.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-base35-standard-symbols-ps-fonts-20170801-10.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-base35-z003-fonts-20170801-10.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/urw-fonts-2.4-16.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/xorg-x11-server-utils-7.7-20.el7.x86_64.rpm

# Get grafana-server
wget https://dl.grafana.com/oss/release/grafana-6.4.3-1.x86_64.rpm

#sudo yum localinstall grafana-6.4.3-1.x86_64.rpm