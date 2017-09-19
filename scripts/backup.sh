#!/bin/bash
while getopts s:u: option
do
 case "${option}"
  in
  s) SERVER=${OPTARG};;
  u) USER=${OPTARG};;
 esac
done
echo "_+=------------------------------------=+_"
echo "Starting Backup: `date`"
echo "Sending tmux commands to $SERVER server!"
sudo -u $USER tmux send-keys -t $SERVER "say Starting Server Backup" ENTER
echo "Sending save-all command to tmux session"
sudo -u $USER tmux send-keys -t $SERVER "save-all" ENTER
echo "Turning world save off for rsync backup"
sudo -u $USER tmux send-keys -t $SERVER "save-off" ENTER
echo "Running rsync as user[ $USER ] on server [ $SERVER ] ..."
sudo -u $USER rsync -azP -H --delete --numeric-ids /opt/$SERVER /opt/backups/$SERVER
echo "Turning world save back on "
sudo -u $USER tmux send-keys -t $SERVER "save-on" ENTER
sudo -u $USER tmux send-keys -t $SERVER "say Server Backup Complete" ENTER
echo "Backup Complete: `date`"
echo "_+=------------------------------------=+_"
