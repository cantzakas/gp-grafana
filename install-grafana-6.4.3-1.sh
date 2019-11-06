#!/bin/bash

# Install grafana-server depencencies
sudo yum localinstall gsmartcontrol-1.1.3-1.el7.x86_64.rpm
sudo yum localinstall libXmu-1.1.2-2.el7.x86_64.rpm
sudo yum localinstall libXt-1.1.5-3.el7.x86_64.rpm
sudo yum localinstall libXxf86misc-1.0.3-7.1.el7.x86_64.rpm
sudo yum localinstall urw-base35-bookman-fonts-20170801-10.el7.noarch.rpm
sudo yum localinstall urw-base35-c059-fonts-20170801-10.el7.noarch.rpm
sudo yum localinstall urw-base35-d050000l-fonts-20170801-10.el7.noarch.rpm
sudo yum localinstall urw-base35-fonts-20170801-10.el7.noarch.rpm
sudo yum localinstall urw-base35-fonts-common-20170801-10.el7.noarch.rpm
sudo yum localinstall urw-base35-gothic-fonts-20170801-10.el7.noarch.rpm
sudo yum localinstall urw-base35-nimbus-mono-ps-fonts-20170801-10.el7.noarch.rpm
sudo yum localinstall urw-base35-nimbus-roman-fonts-20170801-10.el7.noarch.rpm
sudo yum localinstall urw-base35-nimbus-sans-fonts-20170801-10.el7.noarch.rpm
sudo yum localinstall urw-base35-p052-fonts-20170801-10.el7.noarch.rpm
sudo yum localinstall urw-base35-standard-symbols-ps-fonts-20170801-10.el7.noarch.rpm
sudo yum localinstall urw-base35-z003-fonts-20170801-10.el7.noarch.rpm
sudo yum localinstall urw-fonts-2.4-16.el7.noarch.rpm
sudo yum localinstall xorg-x11-server-utils-7.7-20.el7.x86_64.rpm

# Install grafana-server
sudo yum localinstall grafana-6.4.3-1.x86_64.rpm

systemctl daemon-reload
#systemctl enable influxdb.service
systemctl start grafana-server