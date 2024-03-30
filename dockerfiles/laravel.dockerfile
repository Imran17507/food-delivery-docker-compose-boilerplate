FROM composer:2.2.23

WORKDIR /var/www/html

RUN addgroup -g 1000 laravel && adduser -u 1000 -G laravel -s /bin/sh -D laravel
 
USER laravel

RUN composer global require laravel/installer

ENV PATH="$PATH:/tmp/vendor/bin"

ENTRYPOINT [ "laravel", "new", "src" ]
