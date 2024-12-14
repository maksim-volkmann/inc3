FROM debian:latest

# Install packages
RUN apt update && apt install -y \
	php-fpm \
	php-mysqli \
	curl \
	redis \
	php-redis \
	redis-tools

# Copy files
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY /tools/wordpress.sh .

# Run files
RUN chmod +x wordpress.sh

ENTRYPOINT ["./wordpress.sh"]
