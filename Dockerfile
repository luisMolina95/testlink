FROM php:7.4.2-apache


RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pgsql
# RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql pgsql

RUN mkdir /var/testlink && mkdir /var/testlink/logs && mkdir /var/testlink/upload_area
RUN chmod -R a+rwx /var/testlink/logs && chmod -R a+rwx /var/testlink/upload_area



# RUN apt update -q && apt install -yqq mysql-server

# # # Start mysql
# RUN /etc/init.d/mysql 'start'

# WORKDIR /var/www/html/
COPY ./ /var/www/html/
RUN chmod -R a+rwx /var/www/html/gui/templates_c
EXPOSE 80