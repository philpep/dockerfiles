#!/bin/sh

cd /usr/share/etherpad-lite/src
exec node /usr/share/etherpad-lite/src/node/server.js --settings /etc/etherpad-lite/settings.json --sessionkey /var/lib/etherpad-lite/SESSIONKEY.txt --credentials /var/lib/etherpad-lite/credentials.json --apikey /var/lib/etherpad-lite/APIKEY.txt
