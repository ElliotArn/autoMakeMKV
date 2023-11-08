#!/bin/bash
EPISODE="$(sed -n 3p /home/thomas/autoMakeMKV/makeseries/data)"
SEASON="$(sed -n 2p /home/thomas/autoMakeMKV/makeseries/data)"
SERIES="$(sed -n 1p /home/thomas/autoMakeMKV/makeseries/data)"
new=episode"$EPISODE"
s=season"$SEASON"
echo "$new"
((EPISODE++))

echo "$SERIES" > /home/thomas/autoMakeMKV/makeseries/data
{ head -n 1 /home/thomas/autoMakeMKV/makeseries/data; echo "$SEASON"; tail -n +3 /home/thomas/autoMakeMKV/makeseries/data; } > temp.txt && mv temp.txt /home/thomas/autoMakeMKV/makeseries/data
{ head -n 2 /home/thomas/autoMakeMKV/makeseries/data; echo "$EPISODE"; tail -n +3 /home/thomas/autoMakeMKV/makeseries/data; } > temp.txt && mv temp.txt /home/thomas/autoMakeMKV/makeseries/data
mv /home/thomas/autoMakeMKV/makeseries/output/* /home/thomas/autoMakeMKV/makeseries/output/"$new"
scp /home/thomas/autoMakeMKV/makeseries/output/"$new" arn@192.168.1.14:/home/arn/raid/series/"$SERIES"'/'"$s"
rm /home/thomas/autoMakeMKV/makeseries/output/"$new"
