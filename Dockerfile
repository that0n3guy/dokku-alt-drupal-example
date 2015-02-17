FROM that0n3guy/baseimage-nginx-phpfpm-drupal7

ADD . /build
RUN chmod +x /build/.docker/*.sh && chmod +x /build/.docker/*/*.sh

# Update composer
RUN composer self-update

#run composer to install drush.
RUN cd /build && COMPOSER_HOME="/root" composer install --no-dev --prefer-dist --optimize-autoloader --no-interaction
RUN ln -s /build/vendor/drush/drush/drush /usr/bin/drush

# run drush make and copy site to app folder.
RUN cd /build && drush make example.make /build/example
RUN cp -rp /build/example/* /app

# add custom themes/modules/libraries
RUN mkdir /app/sites/example.com #if using multisite... otherwise, stick stuff in /app/sites/all/
RUN cp -rp /build/themes/* /app/sites/all/themes/
RUN cp -rp /build/modules/* /app/sites/all/modules/
RUN cp -rp /build/libraries/* /app/sites/all/libraries/

# setup settings and private folders
RUN cp -rp /build/settings.php /app/sites/example.com/
RUN mkdir -p /app/sites/example.com/private/files # if not using multisite, change example.com to default
RUN mkdir -p /app/sites/example.com/private/tmp # if not using multisite, change example.com to default

# Give web server permissions to access app folder
RUN chown -R www-data:www-data /app

# I like to clear all cache when deploying
RUN cd /app && drush @sites cc all --yes

# nginx is already setup, but this runs our per-site customizations
RUN bash /build/.docker/nginx/setup.sh

# update database when container starts... Can't be done on container deployment (since user/pass are env vars)
RUN bash /build/.docker/drushdb/setup.sh

# setup cron with environment variables for database
RUN bash /build/.docker/cron/setup.sh

# enable errors if php_debug env var is set.
RUN bash /build/.docker/enableDebug.sh

# secure it by removing default keys.
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh