#==========================================================
# PHP 7.2 and Apache
#==========================================================
# Image: php:7.2-apache
#==========================================================
FROM php:7.2-apache
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
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd mysqli zip opcache soap pdo_mysql \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	# Enable reqrite for htaccess
	&& a2enmod rewrite \
	# Clean up
	&& apt-get clean \
	# Link html folder to app folder
	&& rm -rf /var/www/html \
	&& ln -s /var/www/html /app
# Install xdebug.
RUN pecl install xdebug && docker-php-ext-enable xdebug
# Install apcu.
RUN pecl install apcu && docker-php-ext-enable apcu
# Add addition php configuration.
ADD ./.docker/configuration/additional-php.ini   /usr/local/etc/php/conf.d/z99-additional-php.ini
# Add apache vhost configuration.
ADD ./.docker/configuration/apache-vhost.conf   /etc/apache2/sites-enabled/000-default.conf