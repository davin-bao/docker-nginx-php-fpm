#!/bin/bash

if [ -f /home/www ]; then
  chown -Rf www.www /home/www
  chmod -Rf 755 /home/www
fi

if [ -f /home/wwwstorage ]; then
  chmod -Rf 777 /home/www/storage
fi

nginx -g "daemon off;"

php-fpm