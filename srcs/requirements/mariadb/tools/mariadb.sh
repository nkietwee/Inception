#!/bin/bash

#if [ ! -d "/var/lib/mysql/$DB_NAME" ]
#then

#service mariadb start

#echo -e "\nY\nY\n$DB_PASSWORD\n1234\nY\nY\nY\nY\n" | mysql_secure_installation

#mysql << EOF

#CREATE DATABASE $DB_NAME;
#CREATE USER $DB_USER@'%' IDENTIFIED BY '$DB_PASSWORD';
#GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%' IDENTIFIED BY '$DB_PASSWORD';
#FLUSH PRIVILEGES;
#exit;
#EOF

#service mariadb stop

#fi

#@ -> entrypoint
#exec "$@"

service mariadb start

if [ ! -d "/var/lib/mysql/$DB_NAME" ]
then
	# Secure Databases
	echo -e "\nY\nY\n$DB_ROOT\n$DB_ROOT\nY\nY\nY\nY" | mysql_secure_installation

	# Init Databases
	mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
	mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
	mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
	mariadb -e "FLUSH PRIVILEGES;"
fi

service mariadb stop

exec "$@"


