#!/bin/bash

source ~/.bash_profile

orgalorg -o ./hostfile_segonly -v -C sudo mkdir /home/gpadmin/gp-grafana
orgalorg -o ./hostfile_segonly -v -C sudo chown gpadmin:gpadmin /home/gpadmin/gp-grafana
orgalorg -o ./hostfile_segonly -r '/home/gpadmin/gp-grafana' -U -e -v telegraf-1.12.4-1.x86_64.rpm 
orgalorg -o ./hostfile_segonly -r '/home/gpadmin/gp-grafana' -U -e -v host-dashboard_rev2/telegraf.conf 

orgalorg -o ./hostfile_allhosts -v -C sudo yum localinstall -y /home/gpadmin/gp-grafana/telegraf-1.12.4-1.x86_64.rpm
orgalorg -o ./hostfile_allhosts -v -C sudo mv /etc/telegraf/telegraf.conf /etc/telegraf/telegraf.conf.original
orgalorg -o ./hostfile_allhosts -v -C sudo mv /home/gpadmin/gp-grafana/host-dashboard_rev2/telegraf.conf /etc/telegraf/telegraf.conf
orgalorg -o ./hostfile_allhosts -v -C sudo telegraf --test

