# Mariadb
FROM	debian:bullseye

# System setting
RUN	apt update && apt install wget -y

# debugging
RUN	apt install vim -y


# Mariadb install
RUN	apt install mariadb-server -y

# Script
COPY	./tools/mariadb.sh /home/

# Config
COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN	chmod 755 /home/mariadb.sh

ENTRYPOINT ["/home/mariadb.sh"]
CMD	["mysqld"]
