#!/bin/bash

MCPC=MCPC.jar

cd /minecraft

# make sure the server files are up to date
rsync --verbose --ignore-existing --recursive /minecraft-source/ /minecraft/

chown -R minecraft:minecraft .
echo "Running minecraft server..."
exec /sbin/setuser minecraft java -Xmx3G -Xms2G -jar $MCPC nogui
