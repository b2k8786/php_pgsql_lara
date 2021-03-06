FROM php:7.4-apache
COPY . .

RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql
# RUN chmod -R 777 /var/www/html/storage/

RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!/var/www/html/public!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf
# RUN usermod -u 1000 www-data && groupmod -g 1000 www-data
RUN chmod -R 777 storage bootstrap
RUN a2enmod rewrite

# EXPOSE  8080