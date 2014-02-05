#!/usr/bin/env bash

# INSTALL THE MYSQL INFORMED IN THE CONFIGURATION
# AUTHOR: DAVI CRYSTAL / davicrystal@gmail.com / twitter.com/davicrystal

echo "###########################################################"
echo "####     5/6 - STARTING THE OTHER INSTALLATIONS        ####"
echo "###########################################################"

	echo "--> INSTALLING THE phpX-mysql PACKAGE"
	export DEBIAN_FRONTEND=noninteractive | echo -e "N\nN\nN\n" | sudo apt-get install -y $VAGRANT_PHPx_MYSQL

if [ -n VAGRANT_OTHER_PACKAGES ]; then

	echo "--> INSTALLING THE OTHER PACKAGES"
	export DEBIAN_FRONTEND=noninteractive | sudo apt-get install -y $VAGRANT_OTHER_PACKAGES

fi

