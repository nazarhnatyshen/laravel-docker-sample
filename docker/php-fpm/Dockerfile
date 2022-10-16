FROM php:8.1-fpm

RUN apt-get update && \
    apt-get install -y autoconf pkg-config libssl-dev git libzip-dev zlib1g-dev unzip
RUN docker-php-ext-install mysqli pdo_mysql zip 
    

RUN rm -rf /tmp/pear

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf

ENV COMPOSER_ALLOW_SUPERUSER 1
