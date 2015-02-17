#!/bin/bash
# add our startup script that will run composer.  Running composer on startup instead of build because the vendor file isn't mounted until startup.
#  have to do newlines like: https://www.dougv.com/2006/12/fixing-a-bad-minute-error-message-when-trying-to-use-crontab-with-certain-unix-text-editors/

# sometimes we need to have environment variables in cron... this is how I do it.
#echo "MYSQL_HOST=$MYSQL_HOST" > /tmp/crontemp
#echo "MYSQL_USER=$MYSQL_USER" >> /tmp/crontemp
#echo "MYSQL_PASSWORD=$MYSQL_PASSWORD" >> /tmp/crontemp
#echo "MYSQL_DBNAME=$MYSQL_DBNAME" >> /tmp/crontemp
#
#cat /build/.docker/cron/crontab >> /tmp/crontemp
#
#mv /tmp/crontemp /build/.docker/cron/crontab

crontab -r -u www-data
crontab -u www-data /build/.docker/cron/crontab