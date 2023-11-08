#!/bin/bash
SEASON="$(sed -n 2p /home/thomas/autoMakeMKV/makeseries/data)"
SERIES="$(sed -n 1p /home/thomas/autoMakeMKV/makeseries/data)"
SEASON=season"$SEASON"


ssh arn@192.168.1.14  "mkdir /home/arn/raid/series/$SERIES"/"'$SEASON'"
