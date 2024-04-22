#!/bin/bash

if [ ! -d "/var/lib/mysql/$DB_NAME" ]
then

service mariadb start

echo -e "\nY\nY\n$DB_\n1234\nY\nY\nY\nY\n" | mysql_secure_installation

mysql << EOF

CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
FLUSH PRIVILEGES;
exit;
EOF

service mariadb stop

fi

#@ -> entrypoint
exec "$@"
