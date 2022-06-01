#! /bin/bash

mkdir -p /var/www/html
# tar -xvf wordpress-5.9.3-fr_FR.tar.gz -C /var/www/html
wget https://fr.wordpress.org/wordpress-5.9.3-fr_FR.tar.gz
tar xvf wordpress-5.9.3-fr_FR.tar.gz
mv wordpress /var/www/html/
cp wp.sh /var/www/html/wordpress
cp www.conf /etc/php/7.3/fpm/pool.d/www.conf
chown -R www-data:www-data /var/www/html
cd /var/www/html/wordpress
cp wp-config-sample.php wp-config.php
sed -i "s/votre_nom_de_bdd/${DB_NAME}/" ./wp-config.php
sed -i "s/votre_utilisateur_de_bdd/${MYSQL_USER}/" ./wp-config.php
sed -i "s/votre_mdp_de_bdd/$MYSQL_PASSWORD/" ./wp-config.php
sed -i "s/localhost/mariadb:3306/" ./wp-config.php
echo haha
ls

# if ! wp --allow-root --path='/var/www/html/wordpress/' core is-installed;
#then
	

# fi
# php-fpm7.3 -F
# sleep infinity
