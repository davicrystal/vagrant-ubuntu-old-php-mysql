#!/usr/bin/env bash

# INSTALL THE MYSQL INFORMED IN THE CONFIGURATION
# AUTHOR: DAVI CRYSTAL / davicrystal@gmail.com / twitter.com/davicrystal

echo "###########################################################"
echo "####     6/6 - STARTING THE OTHER INSTALLATIONS        ####"
echo "###########################################################"

if [ -n VAGRANT_OTHER_PACKAGES ]; then

	sudo apt-get install -y $VAGRANT_OTHER_PACKAGES

fi

