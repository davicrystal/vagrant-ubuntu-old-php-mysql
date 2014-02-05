#!/usr/bin/env bash

# INSTALL THE MYSQL INFORMED IN THE CONFIGURATION
# AUTHOR: DAVI CRYSTAL / davicrystal@gmail.com / twitter.com/davicrystal

echo "###########################################################"
echo "####     4/6 - STARTING THE PHPMYADMIN INSTALLATION    ####"
echo "###########################################################"

cd "$VAGRANT_PHPMYADMIN_PATH"
sudo wget "$VAGRANT_PHPMYADMIN_VERSION"
sudo tar -zxvf "$VAGRANT_TARGZ_FILE"
sudo mv "$VAGRANT_TMP_PATH" phpMyAdmin/
sudo rm "$VAGRANT_TARGZ_FILE"
cd phpMyAdmin/
sudo cp config.sample.inc.php config.inc.php
ALLOWNOPASSWORD=$(echo $VAGRANT_PHPMYADMIN_ALLOWNOPASSWORD | tr [A-Z] [a-z])

	if [ "$ALLOWNOPASSWORD" = "true" ]; then

        echo "###########################################################"
		echo "###  ATTENTION: PHPMYADMIN ALLOWNOPASSWORD ACTIVATED!  ####"
		echo "###########################################################"

	    sudo sed -i "s/\$cfg\['Servers'\]\[\$i\]\['AllowNoPassword'\] = false;/\$cfg\['Servers'\]\[\$i\]\['AllowNoPassword'\] = true;/g" config.inc.php 


	fi

sudo ln -s "$VAGRANT_PHPMYADMIN_PATH"/phpMyAdmin/ "$VANGRANT_WWW_PATH"/phpmyadmin
cd