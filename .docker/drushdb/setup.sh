#!/bin/sh
# add our startup script that will run composer.  Running composer on startup instead of build because the vendor file isn't mounted until startup.
cp -a /build/.docker/drushdb/init.sh /etc/my_init.d/00_updatedb.sh
chmod +x /etc/my_init.d/00_updatedb.sh


