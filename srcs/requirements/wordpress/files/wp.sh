#! /bin/bash

# if ! wp --allow-root --path='/var/www/html/wordpress/' core is-installed;
#then
	wp core install --allow-root --url=$DOMAIN_NAME --title="Inception" --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PSW --admin_email=$ADMIN_MAIL 2>res2
	# /var/www/html/wordpress# wp core install --allow-root --url='lburnet.42.fr' --title="Inception" --admin_user=nimda --admin_password=bouh --admin_email=nimda@mail.com
	wp user create $USER_NAME $USER_MAIL --role='editor' --user_pass=$USER_PSW --allow-root 2>res3
# fi
# php-fpm7.3 -F
sleep infinity
