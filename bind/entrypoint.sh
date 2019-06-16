#!/bin/sh
set -e
rndc-confgen -a -c /etc/bind/rndc-key.key
exec $*
