FROM php:7.4-apache
# RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql

COPY src/ /var/www/html/
RUN chmod -R 777 /var/www/html/storage/
RUN cd /var/www/html
# RUN php artisan migrate
EXPOSE  8080