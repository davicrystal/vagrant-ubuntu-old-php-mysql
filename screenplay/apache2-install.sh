#!/usr/bin/env bash

# INSTALL THE LASTED VERSION OF THE APACHE SERVER
# AUTHOR: DAVI CRYSTAL / davicrystal@gmail.com / twitter.com/davicrystal

echo "###########################################################"
echo "####   1/6 - STARTING THE APACHE SERVER INSTALATION    ####"
echo "###########################################################"

sudo apt-get install -y apache2 apache2-threaded-dev libapache2-mod-php5

echo "###########################################################"
echo "####      2/6 - SETTING THE VANGRANT SYMBOLIC LINKS    ####"
echo "###########################################################"

sudo rm -rf "$VANGRANT_WWW_PATH"
sudo ln -fs "$VANGRANT_MAIN_PATH" "$VANGRANT_WWW_PATH"
