cp -R /var/www/vagrant-sites-config/* /etc/apache2/sites-available
cd /etc/apache2/sites-available
a2ensite local.cp1alt.com.conf
a2ensite phpmyadmin.cp1alt.com.conf
service apache2 reload
service apache2 restart

mysql -uroot -proot << EOF
CREATE DATABASE IF NOT EXISTS cp1alt;
CREATE USER 'cp1alt'@'localhost' IDENTIFIED BY 'cp1alt';
GRANT ALL PRIVILEGES ON cp1alt.* TO 'cp1alt'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
quit
EOF

exit;
