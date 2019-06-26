FROM php:7.3-apache

RUN apt-get update && apt-get install -y git libzip-dev zip unzip zlib1g-dev libgmp-dev build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN docker-php-ext-install pdo pdo_mysql zip bcmath gmp gd
RUN a2enmod rewrite
