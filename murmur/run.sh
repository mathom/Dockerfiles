#!/bin/sh


chown -R mumble-server /data

# the following is from https://github.com/overshard/docker-mumble/blob/master/scripts/start
if [ ! -f /data/superuser_password.txt ]
then
    SUPERUSER_PASSWORD=`pwgen -cns -1 32 1`
    echo $SUPERUSER_PASSWORD > /data/superuser_password.txt
    exec /sbin/setuser mumble-server /usr/sbin/murmurd -ini /data/murmur.ini -supw $SUPERUSER_PASSWORD
    sleep 3
    echo
    echo "# ------------------------------------------------------------------------------"
    echo "# SuperUser Password"
    echo "#"
    echo "# Password: $SUPERUSER_PASSWORD"
    echo "#"
    echo "# Connect to the server as SuperUser and setup an admin user."
    echo "# ------------------------------------------------------------------------------"
    echo
fi

exec /sbin/setuser mumble-server /usr/sbin/murmurd -fg -ini /data/murmur.ini -v
