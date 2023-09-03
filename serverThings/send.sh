
#!/bin/bash
name="$(blkid -s LABEL -o value)"
echo -e "\n\n\n\n\n"
read -p ""$name"   :" input
if [ "$input" == "" ]; then
new="/home/thomas/Documents/autoMakeMKV/serverThings/output/$name.mkv"
	else
new=/home/thomas/Documents/autoMakeMKV/serverThings/output/"$input".mkv
fi
mv /home/thomas/Documents/autoMakeMKV/serverThings/output/* "$new"
scp "$new" "arn@192.168.1.14:/home/arn/data/movies"
rm "$new"
