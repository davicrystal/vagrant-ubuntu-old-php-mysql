#!/usr/bin/env bash

# PUT IN THIS FILE YOUR OWN CUSTOMIZED PROCEDURES
# AUTHOR: YOU!

echo "ATIVANDO REWRITE DO APACHE PARA URL AMIGÁVEL"

sudo a2enmod rewrite
sudo sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default
sudo service apache2 restart

