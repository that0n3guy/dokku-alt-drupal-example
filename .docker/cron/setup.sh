#!/bin/sh

cp -a /build/.docker/cron/init.sh /etc/my_init.d/00_setup_cron.sh
chmod +x /etc/my_init.d/00_setup_cron.sh
