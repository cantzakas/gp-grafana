#!/bin/bash

orgalorg -o sdw1 -o sdw2 -o sdw3 -o sdw4 -o sdw5 -o sdw6 -o sdw7 -o sdw8 -v -C sudo mkdir /home/gpadmin/gp-grafana
orgalorg -o sdw1 -o sdw2 -o sdw3 -o sdw4 -o sdw5 -o sdw6 -o sdw7 -o sdw8 -v -C sudo chown gpadmin:gpadmin /home/gpadmin/gp-grafana
orgalorg -o sdw1 -o sdw2 -o sdw3 -o sdw4 -o sdw5 -o sdw6 -o sdw7 -o sdw8 -r '/home/gpadmin/gp-grafana' -U -e -v telegraf-1.12.4-1.x86_64.rpm 
orgalorg -o sdw1 -o sdw2 -o sdw3 -o sdw4 -o sdw5 -o sdw6 -o sdw7 -o sdw8 -r '/home/gpadmin/gp-grafana' -U -e -v host-dashboard_rev2/telegraf.conf 

orgalorg -o mdw -o sdw1 -o sdw2 -o sdw3 -o sdw4 -o sdw5 -o sdw6 -o sdw7 -o sdw8 -v -C sudo yum localinstall -y /home/gpadmin/gp-grafana/telegraf-1.12.4-1.x86_64.rpm
orgalorg -o mdw -o sdw1 -o sdw2 -o sdw3 -o sdw4 -o sdw5 -o sdw6 -o sdw7 -o sdw8 -v -C sudo mv /etc/telegraf/telegraf.conf /etc/telegraf/telegraf.conf.original
orgalorg -o mdw -o sdw1 -o sdw2 -o sdw3 -o sdw4 -o sdw5 -o sdw6 -o sdw7 -o sdw8 -v -C sudo mv /home/gpadmin/gp-grafana/host-dashboard_rev2/telegraf.conf /etc/telegraf/telegraf.conf
orgalorg -o mdw -o sdw1 -o sdw2 -o sdw3 -o sdw4 -o sdw5 -o sdw6 -o sdw7 -o sdw8 -v -C sudo telegraf --test

