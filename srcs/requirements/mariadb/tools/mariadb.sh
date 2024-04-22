#!/bin/bash

service mariadb start

echo -e "\nY\nY\n1234\n1234\nY\nY\nY\nY\n" | mysql_secure_installation

mysql << EOF

CREATE DATABASE ${DB_NAME};
CREATE USER ${DB_USER}@'%' IDENTIFIED BY ${DB_PASSWORD};
GRANT ALL PRIVILEGES ON ${DBNAME}.* TO ${DB_USER}@'%' IDENTIFIED BY ${DB_PASSWORD};
FLUSH PRIVILEGES;
exit;
EOF

service mariadb stop

#@ -> entrypoint
exec "$@"
