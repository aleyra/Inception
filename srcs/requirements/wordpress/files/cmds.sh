#! /bin/bash

# if [ ! -f "wp-config.php" ]; then
	
	echo "config done ?"
	wp core install --allow-root --url=$DOMAIN_NAME --title="Inception" --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PSW --admin_email=$ADMIN_MAIL 2>res2
	echo "install done ?"
	wp user create $USER_NAME $USER_MAIL --role='editor' --user_pass=$USER_PSW --allow-root 2>res3
	echo "create done ?"
	# service php7.3-fpm stop
	# rm -rf cmds.sh
	# php-fpm7.3 -F
# fi
# su root
