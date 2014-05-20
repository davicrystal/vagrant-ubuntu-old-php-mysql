#!/usr/bin/env bash

# PUT IN THIS FILE YOUR OWN CUSTOMIZED PROCEDURES
# AUTHOR: YOU!

echo "ATIVANDO REWRITE DO APACHE PARA URL AMIGÁVEL"

sudo a2enmod rewrite
sudo sed -i '/DocumentRoot \/var\/www/c 	DocumentRoot \/var\/www \n\n\<Directory \/var\/www\>\n AllowOverride All \n \<\/Directory\>' /etc/apache2/sites-available/000-default.conf

echo "CONFIGURANDO O TIMEZONE NO PHP.INI"
sudo sed -i '/;date.timezone =/c date.timezone = America\/Sao_Paulo' /etc/php5/apache2/php.ini
sudo sed -i '/;date.timezone =/c date.timezone = America\/Sao_Paulo' /etc/php5/cli/php.ini
sudo service apache2 restart

echo "CONFIGURANDO A RESOLUÇÃO DE DNS"

sudo echo "nameserver 8.8.8.8" > /etc/resolvconf/resolv.conf.d/base
sudo echo "nameserver 8.8.4.4" > /etc/resolvconf/resolv.conf.d/base
sudo resolvconf -u

echo "INSTALANDO COMPOSER"

cd
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer