#!/bin/sh
if [ "$1" = "include" ]; then
    aptly repo include -ignore-signatures -accept-unsigned $2
    aptly publish list -raw | while read line; do
        prefix=$(echo $line | awk '{ print $1 }')
        dist=$(echo $line | awk '{ print $2 }')
        aptly publish update $dist $prefix
    done
fi
D=/var/lib/aptly/incoming
exec inoticoming --foreground --initialsearch $D --suffix .changes --chdir $D $0 include {} \;
