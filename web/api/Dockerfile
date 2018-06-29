FROM php:7.2.5-apache

#RUN find /etc/apache2/sites-available/ -type f -and -not -name "*default*" -exec a2ensite {} \;

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

RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

RUN a2enmod rewrite

COPY ./conf/*.conf /etc/apache2/sites-available/
RUN echo "Listen 81" >> /etc/apache2/ports.conf

RUN a2ensite api.local.conf