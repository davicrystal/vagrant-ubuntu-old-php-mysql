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

echo "ATUALIZANDO ÚLTIMA VERSÃO DO PHP"

sudo add-apt-repository -y ppa:ondrej/php5
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install php5

echo "CRIANDO BASE DE DADOS"
#sudo service mysql start

#mysql -u root CREATE democosmos
#mysql -u root CREATE cosmos_midas
#mysql -u root CREATE cosmos_versoes

echo "IMPORTANDO BASE DE DADOS"

#mysql -u root -p 1234 democosmos < /var/www/bd-dev-dup/democosmos.sql
#mysql -u root -p 1234 cosmos_midas < /var/www/bd-dev-dup/cosmos_midas.sql
#mysql -u root -p 1234 democosmos < /var/www/bd-dev-dup/cosmos_versoes.sql


