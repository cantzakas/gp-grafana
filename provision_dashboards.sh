#!/bin/bash

if [ ! -d "/var/lib/grafana/dashboards" ]; then
  sudo mkdir /var/lib/grafana/dashboards
fi


cat provisioning_dashboards.txt | while read line
do
  sudo cp $line /var/lib/grafana/dashboards
done

