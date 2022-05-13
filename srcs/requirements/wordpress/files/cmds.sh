#! /bin/bash

# if [ ! -f "wp-config.php" ]; then
	cd /var/www/html/wordpress 
	cp wp-config-sample.php wp-config.php
	sed -i "s/database_name_here/$DB_NAME/" ./wp-config.php 
	sed -i "s/username_here/$MYSQL_USER/" ./wp-config.php 
	sed -i "s/password_here/$MYSQL_PASSWORD/" ./wp-config.php 
	sed -i "s/localhost/mariadb:3306/" ./wp-config.php
	# wp core config --allow-root --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbprefix=wp_ 2>res1
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
