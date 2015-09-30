#!/usr/bin/env bash

# SHELL BOOTSTRAP SCREENPLAY FOR GENERATE UBUNTU ENVIRONMENT WITH OLD OR NEW VERSIONS OF PHP AND MYSQL 
# IMPORTANT: FOR VAGRANT USE ONLY / Vagrant version (1.4.3)
# DESIGNED FOR UBUNTU 14.04 USING AND PHP5.X
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
VAGRANT_PHP_VERSION="http://br1.php.net/get/php-5.5.29.tar.gz/from/this/mirror"
#http://museum.php.net/php5/php-5.5.3.tar.gz"

# PATH FOR php.ini
VAGRANT_PHP_INI_PATH="/usr/local/lib"

# URL FOR THE MYSQL INSTALLATION PACKAGE, SEE MORE VERSIONS OPTIONS IN http://downloads.mysql.com/archives/community/
# IMPORTANT: THE CODE SUPORTS JUST.tar.gz FILES
VAGRANT_MYSQL_VERSION="http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.26-linux-glibc2.5-i686.tar.gz"

# MYSQL USER WITH ALL PREVILEGES (DO NOT USE ROOT)
VAGRANT_MYSQL_USER="test"

# MYSQL MAIN USER PASSWORD (OPITIONAL)
VAGRANT_MYSQL_PWD=""

# URL FOR THE PHPMYADMIN INSTALLATION PACKAGE, SEE MORE VERSIONS OPTIONS IN http://www.phpmyadmin.net/home_page/downloads.php
# IMPORTANT: THE CODE SUPORTS JUST.tar.gz FILES
VAGRANT_PHPMYADMIN_VERSION="https://files.phpmyadmin.net/phpMyAdmin/4.3.13.1/phpMyAdmin-4.3.13.1-all-languages.tar.gz"

# PATH FOR PHPMYADMIN INSTALLATION
VAGRANT_PHPMYADMIN_PATH="/usr/share/"

# ALLOW ACCESS FOR USER WITH NO PASSWORD IN THE PHPMYADMIN
VAGRANT_PHPMYADMIN_ALLOWNOPASSWORD="true"

# SET THE NAME OF libapache2-mod-phpX for your PHP Version
VAGRANT_APACHE2_MOD="libapache2-mod-php5"

# SET THE NAME OF phpX-mysql for your PHP Version
VAGRANT_PHPx_MYSQL="php5-mysql"

# SET OTHER PACKAGES FOR APT-GET INSTALLATION, SPLIT IT WITH SPACES
# PLEASE: DON'T INSTALL APACHE, PHP, MYSQL, PHPMYADMIN :/
# THE FOLLOW PACKAGES WILL BE INSTALLED: apache2-threaded-dev libapache2-mod-php5 libxml2-dev
# EXEMPLE OF USE: VAGRANT_OTHERS_PACKAGES="php5-cli php5-dev php5-mcrypt php5-curl"
VAGRANT_OTHER_PACKAGES="php5-curl subversion php5-gd php5-json curl"

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
export VAGRANT_MYSQL_USER
export VAGRANT_MYSQL_PWD
sh "$VANGRANT_BOOTSTRAP_PATH"/screenplay/mysql-install.sh

# INSTALL THE APACHE SERVER
export VANGRANT_WWW_PATH
export VANGRANT_MAIN_PATH
export VAGRANT_APACHE2_MOD
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
export VAGRANT_PHPx_MYSQL
sh "$VANGRANT_BOOTSTRAP_PATH"/screenplay/other-install.sh

# RUN THE CUSTOMIZED PROCEDURES
echo "###########################################################"
echo "####          6/6 - CUSTOMIZED PROCEDURES              ####"
echo "###########################################################"
sh "$VANGRANT_BOOTSTRAP_PATH"/screenplay/custom-install.sh

# GENERATE A INFO PHP FILE
echo "... GENERATING THE INFO.PHP FILE"
sudo touch "$VANGRANT_WWW_PATH"/info.php
sudo echo "<?php phpinfo(); ?>" > "$VANGRANT_WWW_PATH"/info.php

echo "###########################################################"
echo "####               ALL DONE! GOOD WORK! :)             ####"
echo "###########################################################"
echo "For more informations -> http://localhost:your_port/info.php"
echo "For to use phpmyadmin -> http://localhost:your_port/phpmyadmin"

exit 0
