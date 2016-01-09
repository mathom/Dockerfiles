#!/bin/sh -e

echo Updating mumble-server

apt-get update
apt-get install -y mumble-server

echo Update complete
