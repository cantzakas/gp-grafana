#!/bin/bash

sudo yum localinstall -y telegraf-1.12.4-1.x86_64.rpm

#systemctl daemon-reload
#systemctl enable influxdb.service
#systemctl start telegraf
