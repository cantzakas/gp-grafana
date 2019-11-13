#!/bin/bash

orgalorg -o sdw1 -o sdw2 -o sdw3 -o sdw4 -v -C sudo mkdir /home/gpadmin/gp-grafana
orgalorg -o sdw1 -o sdw2 -o sdw3 -o sdw4 -v -C sudo chown gpadmin:gpadmin /home/gpadmin/gp-grafana
orgalorg -o sdw1 -o sdw2 -o sdw3 -o sdw4 -r '/home/gpadmin/gp-grafana' -U -e -v telegraf-1.12.4-1.x86_64.rpm 
orgalorg -o sdw1 -o sdw2 -o sdw3 -o sdw4 -r '/home/gpadmin/gp-grafana' -U -e -v install-telegraf-1.12.4-1.sh 
orgalorg -o sdw1 -o sdw2 -o sdw3 -o sdw4 -r '/home/gpadmin/gp-grafana' -U -e -v host-dashboard_rev2/telegraf.conf 

orgalorg -o mdw -o sdw1 -o sdw2 -o sdw3 -o sdw4 -C /home/gpadmin/gp-grafana/install-telegraf-1.12.4-1.sh
orgalorg -o mdw -o sdw1 -o sdw2 -o sdw3 -o sdw4 -C sudo mv /etc/telegraf/telegraf.conf /etc/telegraf/telegraf.conf.original
orgalorg -o mdw -o sdw1 -o sdw2 -o sdw3 -o sdw4 -C sudo mv /home/gpadmin/gp-grafana/host-dashboard_rev2/telegraf.conf /etc/telegraf/telegraf.conf
orgalorg -o mdw -o sdw1 -o sdw2 -o sdw3 -o sdw4 -C sudo telegraf --test
