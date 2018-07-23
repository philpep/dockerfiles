#!/bin/sh
set -e
/usr/sbin/cron
omd start philpep
tail -f /var/log/nagios.log
