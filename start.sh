#!/bin/bash

cd /home/steam
echo sed
sed -i 's/steamuser="username"/steamuser=REPLACE_USER/' tf2server
sed -i 's/steampass="password"/steampass=REPLACE_PASSWORD/' tf2server
sed -i "s/steamuser=REPLACE_USER/steamuser='$STEAM_USERNAME'/" tf2server
sed -i "s/steampass=REPLACE_PASSWORD/steampass='$STEAM_PASSWORD'/" tf2server
# set_steam_guard_code $STEAM_GUARD_CODE
yes y|./tf2server install
bash /run.sh
