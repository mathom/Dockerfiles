#!/bin/bash -e

MURMUR_INI=/data/murmur.ini

if [ ! -f $MURMUR_INI ]; then
    echo Initializing $MURMUR_INI

    m4 -DMURMUR_MOTD="${MURMUR_MOTD-Welcome to mumble}" \
       -DMURMUR_PASSWD="${MURMUR_PASSWORD-}"\
       -DMURMUR_BANDWIDTH="${MURMUR_BANDWIDTH-72000}" \
       -DMURMUR_DATABASE=/data/murmur.sqlite \
       /etc/default-murmur.ini > $MURMUR_INI
fi

