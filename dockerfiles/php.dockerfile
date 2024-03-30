FROM php:8.3-fpm-alpine

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --2.2 --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

RUN addgroup -g 1000 laravel && adduser -u 1000 -G laravel -s /bin/sh -D laravel
 
USER laravel
