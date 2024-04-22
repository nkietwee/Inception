#!/bin/bash

cd /var/www/html/wordpress

wp config create --allow-root \
		--dbname='wordpress_db' \
		--dbuser='wordpress_user' \
		--dbpass='password' \
		--dbhost='mariadb:3306' \
		--path='/var/www/html/wordpress'

wp core install --allow-root \
		--url='localhost' \
		--title='Page' \
		--admin_password='1234' \
		--admin_user='Admew' \
		--admin_email='mew@gmail.com'

wp user create nkietwee nkietwee@gmail.com --allow-root  --user_pass='1234' 

exec "$@"
