#!/usr/bin/env bash

# INSTALL THE PHP INFORMED IN THE CONFIGURATION
# AUTHOR: DAVI CRYSTAL / davicrystal@gmail.com / twitter.com/davicrystal

echo "###########################################################"
echo "####              3/6 - PHP INSTALATION                ####"
echo "###########################################################"

sudo apt-get install -y libxml2-dev
cd "$VANGRANT_WWW_PATH"
wget "$VAGRANT_PHP_VERSION"
tar zxvf "$VAGRANT_TARGZ_FILE"
cd "$VAGRANT_TMP_PATH"
./configure --with-mysqli=mysqlnd
sudo make
sudo make -i install
sudo cp php.ini-production "$VAGRANT_PHP_INI_PATH"/php.ini
cd ..
rm "$VAGRANT_TARGZ_FILE"
rm -r "$VAGRANT_TMP_PATH"
cd