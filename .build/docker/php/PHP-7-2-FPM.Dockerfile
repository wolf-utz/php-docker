#==========================================================
# PHP 7.2 FPM
#==========================================================
# Image: https://hub.docker.com/_/php/
#==========================================================
FROM php:7.2-fpm
# Install gd, mysqli, zip, opcache and soap.
RUN apt-get update && \
	apt-get install -y \
	curl \
	nano \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libpng-dev \
	libxml2-dev \
	libicu-dev \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd mysqli zip opcache intl \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Install apcu.
RUN pecl install apcu \
 	&& docker-php-ext-enable apcu
# Add addition php configuration.
ADD .configuration/additional-php.ini   /usr/local/etc/php/conf.d/z99-additional-php.ini