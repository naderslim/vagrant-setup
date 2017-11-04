cp -R /var/www/vagrant-sites-config/* /etc/apache2/sites-available
cd /etc/apache2/sites-available
a2ensite local.PROJECT_NAME.com.conf
a2ensite phpmyadmin.PROJECT_NAME.com.conf
service apache2 reload
service apache2 restart

mysql -uroot -proot << EOF
CREATE DATABASE IF NOT EXISTS PROJECT_NAME;
CREATE USER 'PROJECT_NAME'@'localhost' IDENTIFIED BY 'PROJECT_NAME';
GRANT ALL PRIVILEGES ON PROJECT_NAME.* TO 'PROJECT_NAME'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
quit
EOF

exit;
