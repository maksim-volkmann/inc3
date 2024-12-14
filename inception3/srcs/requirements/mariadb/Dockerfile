FROM debian:stable

# Install packages
RUN apt-get update && apt-get install -y mariadb-server && apt-get clean

# Copy files
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb.sh /usr/local/bin/mariadb.sh

# Run files
RUN chmod +x /usr/local/bin/mariadb.sh
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

# Ports
EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]
