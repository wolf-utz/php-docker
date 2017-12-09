#==========================================================
# Nginx Docker container
#==========================================================
# Image: https://hub.docker.com/_/php/
#==========================================================
FROM php:7-fpm
RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmcrypt-dev \
		libpng-dev \
	# && docker-php-ext-install -j$(nproc) iconv mcrypt \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd
# RUN pecl install redis-3.1.0 \
# 	&& pecl install xdebug-2.5.0 \
# 	&& docker-php-ext-enable redis xdebug
# RUN libmemcached-dev zlib1g-dev \
# 	&& pecl install memcached-2.2.0 \
# 	&& docker-php-ext-enable memcached
ADD .configuration/additional-php.ini   /usr/local/etc/php/conf.d/