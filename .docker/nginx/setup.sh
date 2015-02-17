#!/bin/sh
# you can do any nginx customizatoins you want here like: rewrite nginx.conf, mess with php-fpm, etc...

# Setup a basic virtualhost file.
# Based on boost enabled version here: https://github.com/perusio/drupal-with-nginx/blob/D7/sites-available/example.com.conf
# ...  but with removed IPv6, www redirect, /app set as root dir, no ssl stuff (do that with dokku-alt instead).
cp -a /build/.docker/nginx/site-default /etc/nginx/sites-available/site-default

# enable your site with nginx_ensite: https://github.com/perusio/nginx_ensite
nginx_ensite site-default