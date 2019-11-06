#!/bin/bash

sudo yum localinstall influxdb-1.7.9.x86_64.rpm

systemctl daemon-reload
#systemctl enable influxdb.service
systemctl start influxdb.service
