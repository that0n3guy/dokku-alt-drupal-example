#!/bin/bash
# if php_debug environment var is set, enable all errors as well
if [ -n "${php_debug}" ]; then
    echo "display_errors = on" >> /etc/php5/fpm/php.ini
    echo "error_reporting = E_ALL" >> /etc/php5/fpm/php.ini
fi



