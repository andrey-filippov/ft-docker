FROM php:7.2.5-apache

RUN set -ex; \
	\
	apt-get update; \
	apt-get install -y \
	    git \
	    zlib1g-dev \
	    libxml2-dev \
	    libmcrypt-dev \
		sudo \
		less \
		wget \
	; \
	rm -rf /var/lib/apt/lists/*; \
	\
	usermod -u 1000 www-data

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install calendar gettext intl
RUN docker-php-ext-install json mbstring pdo
RUN docker-php-ext-install soap zip

RUN pecl install mongodb
RUN pecl install xdebug

RUN docker-php-ext-enable xdebug

RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

RUN { \
		echo "zend_extension=$(find /usr/local/lib/php/ -name xdebug.so)"; \
		echo "xdebug.remote_enable=on"; \
        echo "xdebug.remote_handler=dbgp"; \
        echo "xdebug.remote_connect_back=Off"; \
        echo "xdebug.remote_autostart=on"; \
        echo "xdebug.remote_port=9000"; \
	} > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN a2enmod rewrite

COPY ./conf/*.conf /etc/apache2/sites-available/
RUN echo "Listen 8082" >> /etc/apache2/ports.conf

RUN a2ensite fysiotest.local.conf