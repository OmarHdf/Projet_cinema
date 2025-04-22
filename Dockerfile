# Utilise l'image officielle PHP avec Apache
FROM php:8.2-apache

# Active les modules Apache nécessaires
RUN a2enmod rewrite

# Installe les extensions PHP nécessaires (mysqli pour MySQL)
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Copie tous les fichiers dans le dossier web de l'image
COPY . /var/www/html/

# Change les droits d’accès
RUN chown -R www-data:www-data /var/www/html

# Active le RewriteEngine
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Expose le port 80
EXPOSE 80
