# Use Debian as the base image
FROM debian:stable

# Install Apache, PHP, and required extensions
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-mysqli \
    wget \
	curl \
    && apt-get clean

# Set the ServerName globally to avoid warnings
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Download Adminer
RUN wget -O /var/www/html/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

# Copy custom Apache configuration file
COPY ./conf/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./conf/ports.conf /etc/apache2/ports.conf

# Remove the default index.html file
RUN rm -f /var/www/html/index.html

# Enable the new site and disable the default site
# RUN a2ensite adminer.conf && a2dissite 000-default.conf

# Expose port 8080
EXPOSE 8080

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
