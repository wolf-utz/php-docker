#==========================================================
# Nginx Docker container
#==========================================================
# Image: https://hub.docker.com/_/php/
#==========================================================
FROM php:7-fpm
RUN apt-get update && \
	apt-get install -y \
	curl \
	nano \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libpng-dev \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd mysqli zip opcache \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN pecl install apcu \
  && docker-php-ext-enable apcu
ADD .configuration/additional-php.ini   /usr/local/etc/php/conf.d/