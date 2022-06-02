#! /bin/bash


	wp core install --allow-root --url=$DOMAIN_NAME --title=$DOMAIN_NAME --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PSW --admin_email=$ADMIN_MAIL 2>res2
	wp user create $USER_NAME $USER_MAIL --role='editor' --user_pass=$USER_PSW --allow-root 2>res3
php-fpm7.3 -F
