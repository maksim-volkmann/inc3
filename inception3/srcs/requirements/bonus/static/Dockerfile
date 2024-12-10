FROM debian:stable

RUN apt update && apt install -y nginx openssl curl && apt clean

# Generate SSL Certificate
RUN mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=42/OU=Student/CN=${DOMAIN_NAME}"

EXPOSE 443

# Copy a basic HTML file to serve as the default page
COPY index.html /var/www/html/index.html

# Copy NGINX default config
COPY ./conf/default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
