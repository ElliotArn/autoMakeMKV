#!/bin/bash
disk="disc:0" #change this to mach your disk
output="output" #change this to mach your output
times="$(/home/thomas/autoMakeMKV/makeseries/info.sh $disk)"

echo "$times"

for ((i=1; i<=times; i++))
do
    echo "making episode number '$i' on disk" 
    /home/thomas/autoMakeMKV/makeseries/mkvScript.sh "$disk" "$i" "$output"
    /home/thomas/autoMakeMKV/makeseries/send.sh
done

printf '\a'

