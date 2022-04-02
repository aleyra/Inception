#! /bin/bash
su moi
wp core install --allow-root --url=$DOMAIN_NAME --title="inception" --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PSW --admin_email=$ADMIN_MAIL --skip-email -path=/var/www/html/wordpress
su root
# expect "password:"
# send "\r"