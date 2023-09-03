#!/bin/bash

name="$(cmd.exe "/mnt/c/temp/getName.bat" | grep D: | awk '{print $4}')"
echo -e "\n\n\n\n\n"

read -p ""$name"   :" input

if [ "$input" == "" ]; then
	new="/root/serverThings/output/$name.mkv"
else
	new=/root/serverThings/output/"$input".mkv
fi

mv /root/serverThings/output/* "$new"

scp "$new" "arn@192.168.1.14:/home/arn/data/movies"

rm "$new"
