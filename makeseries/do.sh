#!/bin/bash
times="$(info.sh)"
disk="disc:0" #change this to mach your disk
output="output" #change this to mach your output
echo "$times"

for ((i=1; i<=times; i++))
do
    echo "making episode number '$i' on disk" 
    mkvScript.sh "$disk" "$i" "$output"
    send.sh
done

printf '\a'

