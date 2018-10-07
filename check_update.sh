#!/bin/sh
if test -f /.dockerenv; then
    if test -x /sbin/apk; then
        apk --no-cache list -u | grep 'upgradable from' && exit 1
    elif test -x /usr/bin/apt-get; then
        apt-get update > /dev/null
        apt list --upgradable 2>/dev/null | grep 'upgradable from' && exit 1
    elif test -x /usr/bin/yum; then
        yum check-update || exit 1
    fi
    exit 0
fi
if test -z "$1"; then
    >&2 echo "$0 require image as argument"
    exit 64
fi
if docker run --rm --entrypoint sh -u root -v $(readlink -f $0):/check_update.sh $1 /check_update.sh; then
    echo "\033[0;32m$1 is up-to-date\033[0m"
else
    echo "\033[0;31m$1 need update\033[0m" && exit 1
fi
