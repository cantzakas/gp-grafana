#!/bin/bash

source ~/.bash_profile

orgalorg -o ./hostfile_allhosts -v -C sudo systemctl start telegraf
