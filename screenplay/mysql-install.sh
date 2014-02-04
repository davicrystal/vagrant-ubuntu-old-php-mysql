#!/usr/bin/env bash

# INSTALL THE MYSQL INFORMED IN THE CONFIGURATION
# AUTHOR: DAVI CRYSTAL / davicrystal@gmail.com / twitter.com/davicrystal

echo "###########################################################"
echo "####              4/5 - MYSQL INSTALATION              ####"
echo "###########################################################"
sudo apt-get install libaio1
sudo groupadd mysql
sudo useradd -r -g mysql mysql
cd /usr/local/
sudo wget "$VAGRANT_MYSQL_VERSION"
sudo tar zxvf "$VAGRANT_TARGZ_FILE"
sudo mv "$VAGRANT_TMP_PATH"/ mysql/
cd mysql/
sudo chown -R mysql .
sudo chgrp -R mysql .
sudo scripts/mysql_install_db --user=mysql
sudo chown -R root .
sudo chown -R mysql data
sudo mkdir "$VAGRANT_MYSQL_MY_CNF"
sudo cp support-files/my-medium.cnf "$VAGRANT_MYSQL_MY_CNF"/my.cnf
sudo chown -R mysql "$VAGRANT_MYSQL_MY_CNF"
sudo cp support-files/mysql.server /etc/init.d/mysql.server
sudo touch /var/lib/locales/supported.d/local
sudo chmod 777 /var/lib/locales/supported.d/local
sudo echo "pt_BR.UTF-8 UTF-8" >  /var/lib/locales/supported.d/local
sudo dpkg-reconfigure locales
sudo ln -s /usr/local/mysql/bin/* /bin/
sudo ln -s /etc/init.d/mysql.server /etc/init.d/mysql
sudo update-rc.d mysql.server defaults
sudo mkdir /var/run/mysqld
#sudo ln -s /tmp/mysql.sock /var/run/mysqld/mysqld.sock
sudo mv /tmp/mysql.sock /var/run/mysqld/mysqld.sock
sudo /etc/init.d/mysql start
cd