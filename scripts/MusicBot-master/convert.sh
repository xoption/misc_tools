#!/bin/bash


COUNTER=10


while [  $COUNTER -gt 0 ]; do
let COUNTER=COUNTER-1
echo The counter is $COUNTER

chmod -R 777 audio_cache/
chmod -R 777 newfiles/

for f in audio_cache/*
do

pos= echo | awk '{ print index("'"${f}"'", ".")}' 


ffmpeg -i $f -n -c:v libx264 -preset slow -crf 20 -b:a 128k /home/discordbot/plex/MusicBot-master/newfiles/${f:32:$pos-5}.mp3 

done

chmod -R 777 /home/discordbot/

beet import -a -w -c -s -q /home/discordbot/plex/MusicBot-master/newfiles

echo "sleeping for 500 sec"

sleep 500
 
done
