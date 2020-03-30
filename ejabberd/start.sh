#!/bin/sh
L=/var/log/ejabberd
tail -F $L/crash.log $L/error.log $L/erlang.log &
exec ejabberdctl foreground &
child=$!
ejabberdctl started
wait $child
