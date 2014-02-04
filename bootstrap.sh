#!/usr/bin/env bash

# SHELL BOOTSTRAP SCREENPLAY FOR GENERATE UBUNTU ENVIRONMENT WITH OLD OR NEW VERSIONS OF PHP AND MYSQL 
# IMPORTANT: FOR VAGRANT USE ONLY / Vagrant version (1.4.3)
# DESIGNED FOR UBUNTU 13.04 AMD64 USING http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box
# AUTHOR: DAVI CRYSTAL / davicrystal@gmail.com / twitter.com/davicrystal

# SET THE ENVIRONMENT VARIABLES

# THE PATH FOR BOOTSTRAP IN THE VM ENVIROMENT
VANGRANT_BOOTSTRAP_PATH="/vagrant/vagrant-ubuntu-old-php-mysql"

# THE PATH FOR VANGRANT FILE IN THE VM ENVIRONMENT
VANGRANT_MAIN_PATH="/vagrant"

# THE PATH FOR APACHE WWW
VANGRANT_WWW_PATH="/var/www"

# URL FOR THE PHP INSTALLATION, SEE MORE VERSIONS OPTIONS IN http://www.php.net/releases/
# IMPORTANT: THE CODE SUPORTS JUST.tar.gz FILES
VAGRANT_PHP_VERSION="http://museum.php.net/php5/php-5.4.9.tar.gz"

# PATH FOR php.ini
VAGRANT_PHP_INI_PATH="/usr/local/lib"

# URL FOR THE MYSQL INSTALLATION PACKAGE, SEE MORE VERSIONS OPTIONS IN http://downloads.mysql.com/archives/community/
# IMPORTANT: THE CODE SUPORTS JUST.tar.gz FILES
VAGRANT_MYSQL_VERSION="http://downloads.mysql.com/archives/get/file/mysql-5.5.27-linux2.6-x86_64.tar.gz"

# PATH FOR my.cnf
VAGRANT_MYSQL_MY_CNF="/etc/mysql"

# URL FOR THE PHPMYADMIN INSTALLATION PACKAGE, SEE MORE VERSIONS OPTIONS IN http://www.phpmyadmin.net/home_page/downloads.php
# IMPORTANT: THE CODE SUPORTS JUST.tar.gz FILES
VAGRANT_PHPMYADMIN_VERSION="http://sourceforge.net/projects/phpmyadmin/files/phpMyAdmin/4.1.6/phpMyAdmin-4.1.6-all-languages.tar.gz"

# PATH FOR PHPMYADMIN INSTALLATION
VAGRANT_PHPMYADMIN_PATH="/usr/share/"

# ALLOW ACCESS FOR USER WITH NO PASSWORD IN THE PHPMYADMIN
VAGRANT_PHPMYADMIN_ALLOWNOPASSWORD="true"

# SET OTHER PACKAGES FOR APT-GET INSTALLATION, SPLIT IT WITH SPACES
# PLEASE: DON'T INSTALL APACHE, PHP, MYSQL, PHPMYADMIN :/
# THE FOLLOW PACKAGES WILL BE INSTALLED: apache2-threaded-dev libapache2-mod-php5 libxml2-dev
# EXEMPLE OF USE: VAGRANT_OTHERS_PACKAGES="php5-cli php5-dev php5-mcrypt php5-curl php5-gd"
VAGRANT_OTHER_PACKAGES="php5-mysql php5-curl"

###################################################################
### AFTER THIS POINT JUST CHANGE IF YOU KNOW WHAT YOU ARE DOING ###
###################################################################

echo "###########################################################"
echo "####              INICIALIZING BOOTSTRAP               ####"
echo "###########################################################"

# EXPORTING VARIABLES
VAGRANT_TARGZ_FILE=""
VAGRANT_TMP_PATH=""
export VAGRANT_TARGZ_FILE
export VAGRANT_TMP_PATH

# IMPORT FUNCTIONS
. "$VANGRANT_BOOTSTRAP_PATH"/screenplay/lib/functions.sh

# UPDATE THE APT-GET REPOSITORIES
sudo apt-get update

# INSTALL THE MYSQL
getFile "$VAGRANT_MYSQL_VERSION"
getPath "$VAGRANT_TARGZ_FILE"
export VAGRANT_MYSQL_VERSION
export VAGRANT_MYSQL_MY_CNF
sh "$VANGRANT_BOOTSTRAP_PATH"/screenplay/mysql-install.sh

# INSTALL THE APACHE SERVER
export VANGRANT_WWW_PATH
export VANGRANT_MAIN_PATH
sh "$VANGRANT_BOOTSTRAP_PATH"/screenplay/apache2-install.sh

# INSTALL THE PHP
getFile "$VAGRANT_PHP_VERSION"
getPath "$VAGRANT_TARGZ_FILE"
export VAGRANT_PHP_INI_PATH
export VAGRANT_PHP_VERSION
sh "$VANGRANT_BOOTSTRAP_PATH"/screenplay/php-install.sh

# INSTALL THE PHPMYADMIN
getFile "$VAGRANT_PHPMYADMIN_VERSION"
getPath "$VAGRANT_TARGZ_FILE"
export VAGRANT_PHPMYADMIN_VERSION
export VAGRANT_PHPMYADMIN_PATH
export VAGRANT_PHPMYADMIN_ALLOWNOPASSWORD
sh "$VANGRANT_BOOTSTRAP_PATH"/screenplay/phpmyadmin-install.sh

# INSTALL OTHER APT-GET PACKAGES
export VAGRANT_OTHER_PACKAGES
sh "$VANGRANT_BOOTSTRAP_PATH"/screenplay/other-install.sh

# GENERATE A INFO PHP FILE
echo "... GENERATING THE INFO.PHP FILE"
sudo touch "$VANGRANT_WWW_PATH"/info.php
sudo echo "<?php phpinfo(); ?>" > "$VANGRANT_WWW_PATH"/info.php

echo "###########################################################"
echo "####               ALL DONE! GOOD WORK! :)             ####"
echo "###########################################################"
echo "For more information -> http://localhost:your_port/info.php"

exit 0