#!/bin/bash

cd /minecraft

# make sure the server files are up to date
rsync --verbose --ignore-existing --recursive /minecraft-source/ /minecraft/

echo "Running minecraft server..."
java -Xmx3G -Xms2G -jar MCPC.jar nogui
