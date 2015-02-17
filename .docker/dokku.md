# Dokku Documentation
We are actualy using dokku-alt (not original dokku): https://github.com/dokku-alt/dokku-alt

# How to push commits:
See: https://github.com/dokku-alt/dokku-alt#deploy-an-app


## Before pushing THIS x2staging/x2production app, you need to setup some data volumes/containers:
These are the commands I used as dokku admin:

####Production
```
dokku create example
```

#### Both prod and stag examples
Do the same for sessions, so they survive between builds (not needed... I might not do this in the future.
```
dokku volume:create example_data /data/appdata/example.com/files:/app/sites/example.com/files
dokku volume:link example example_data
chown www-data:www-data /opt/appdata/example.com
```

Set the environment variable for the server types (staging or production)
Production
```
#production
dokku config:set example MYSQL_HOST=HERE \
    MYSQL_USER=HERE \
    MYSQL_PASSWORD=HERE \
    MYSQL_DBNAME=HERE
dokku domains:set example example.com
```