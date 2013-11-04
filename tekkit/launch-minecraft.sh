#!/bin/bash

cd /minecraft

rsync --verbose --ignore-existing --recursive /minecraft-source/ /minecraft/

echo "Running minecraft server..."
java -Xmx3G -Xms2G -jar Tekkit.jar nogui
