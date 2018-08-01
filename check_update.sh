#!/bin/sh
if test -x /sbin/apk; then
    apk --no-cache list -u | grep 'upgradable from'
elif test -x /usr/bin/apt-get; then
    apt-get update > /dev/null && (apt list --upgradable | grep 'upgradable from')
fi
exit 0
