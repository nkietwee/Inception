#!/bin/bash

cd /var/www/html/wordpress

wp config create --allow-root \
		--dbname=${DB_NAME} \
		--dbuser=${DB_USESR} \
		--dbpass=${DB_PASSWORD}\
		--dbhost=${DB_HOSTNAME} \
		--path='/var/www/html/wordpress'

wp core install --allow-root \
		--url=${DOMAIN_NAME} \
		--title=${WP_TITLE} \
		--admin_password=${ADMIN_PASS} \
		--admin_user=${ADMIN_USER} \
		--admin_email=${ADMIN_EMAIL}

#wp user create nkietwee nkietwee@gmail.com --allow-root  --user_pass='1234' 
wp user create ${USER_USER} ${USER_EMAIL} --allow-root --user_pass=${USER_PASS} 

exec "$@"
