#!/bin/bash
SERIES="$(sed -n 1p /home/thomas/autoMakeMKV/makeseries/data)"

ssh arn@192.168.1.14 "mkdir /home/arn/raid/series/'$SERIES'" 

season.sh