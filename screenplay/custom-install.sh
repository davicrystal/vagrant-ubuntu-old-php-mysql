#!/usr/bin/env bash

# PUT IN THIS FILE YOUR OWN CUSTOMIZED PROCEDURES
# AUTHOR: YOU!

echo "ATIVANDO REWRITE DO APACHE PARA URL AMIGÁVEL"

sudo a2enmod rewrite
sudo sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default
sudo service apache2 restart

echo "CONFIGURANDO A RESOLUÇÃO DE DNS"

sudo echo "nameserver 8.8.8.8" > /etc/resolvconf/resolv.conf.d/base
sudo echo "nameserver 8.8.4.4" > /etc/resolvconf/resolv.conf.d/base
sudo resolvconf -u

echo "INSTALANDO COMPOSER"

cd
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer