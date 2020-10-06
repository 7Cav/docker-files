FROM php:7.3-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    mariadb-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install pdo_mysql mysqli gd \
    && docker-php-ext-enable imagick

WORKDIR /var/www/

RUN mkdir data internal_data

RUN chmod 0777 data
RUN chmod 0777 internal_data
