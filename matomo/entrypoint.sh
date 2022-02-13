#!/bin/sh

if test -n "$MATOMO_CONFIG_INI"; then
    cp "$MATOMO_CONFIG_INI" /data/matomo/piwik/config/config.ini.php
fi

exec $*
