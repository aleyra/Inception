#! /bin/bash
su moi
wp core download
echo "download done ?"
wp core config --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --dbprefix=wp_
echo "config done ?"
# wp core install --allow-root --url=$DOMAIN_NAME --title="inception" --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PSW --admin_email=$ADMIN_MAIL --skip-email -path=/var/www/html/wordpress
wp core install --url=$DOMAIN_NAME --title="Inception" --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PSW --admin_email=$ADMIN_MAIL
wp user create $USER_NAME $USER_MAIL --role='editor' --user_pass=$USER_PSW
su root
# expect "password:"
# send "\r"