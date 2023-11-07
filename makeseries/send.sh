#!/bin/bash
EPISODE="$(sed -n 2p /home/thomas/autoMakeMKV/makeseries/data)"
SERIES="$(sed -n 1p /home/thomas/autoMakeMKV/makeseries/data)"
new=$SERIES"$EPISODE"
echo "$new"
((EPISODE++))

echo "$SERIES" > /home/thomas/autoMakeMKV/makeseries/data
{ head -n 1 /home/thomas/autoMakeMKV/makeseries/data; echo "$EPISODE"; tail -n +3 /home/thomas/autoMakeMKV/makeseries/data; } > temp.txt && mv temp.txt /home/thomas/autoMakeMKV/makeseries/data

mv /home/thomas/autoMakeMKV/makeseries/output/* "$new"
scp "$new" "arn@192.168.1.14:/home/arn/raid/series"
rm "$new"
