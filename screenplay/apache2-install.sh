#!/usr/bin/env bash

# INSTALL THE LASTED VERSION OF THE APACHE SERVER
# AUTHOR: DAVI CRYSTAL / davicrystal@gmail.com / twitter.com/davicrystal

echo "###########################################################"
echo "####   2/6 - STARTING THE APACHE SERVER INSTALATION    ####"
echo "###########################################################"

export DEBIAN_FRONTEND=noninteractive | sudo apt-get install -y apache2 apache2-threaded-dev $VAGRANT_APACHE2_MOD

echo "###########################################################"
echo "####      3/6 - SETTING THE VANGRANT SYMBOLIC LINKS    ####"
echo "###########################################################"

sudo rm -rf "$VANGRANT_WWW_PATH"
sudo ln -fs "$VANGRANT_MAIN_PATH" "$VANGRANT_WWW_PATH"
