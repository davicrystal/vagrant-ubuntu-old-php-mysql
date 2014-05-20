#!/usr/bin/env bash

# INSTALL THE MYSQL INFORMED IN THE CONFIGURATION
# AUTHOR: DAVI CRYSTAL / davicrystal@gmail.com / twitter.com/davicrystal

echo "###########################################################"
echo "####              1/5 - MYSQL INSTALATION              ####"
echo "###########################################################"

sudo touch /var/lib/locales/supported.d/local
sudo chmod 777 /var/lib/locales/supported.d/local
sudo echo "pt_BR.UTF-8 UTF-8" >  /var/lib/locales/supported.d/local
sudo dpkg-reconfigure locales
sudo apt-get install libaio1
sudo useradd mysql
cd /usr/local/
sudo wget "$VAGRANT_MYSQL_VERSION"
sudo tar zxvf "$VAGRANT_TARGZ_FILE"
sudo mv "$VAGRANT_TMP_PATH"/ mysql/
sudo rm "$VAGRANT_TARGZ_FILE"
unset TMPDIR
cd mysql/
sudo scripts/mysql_install_db
sudo chown -R mysql.mysql /usr/local/mysql/
sudo cp support-files/mysql.server /etc/init.d/mysql.server
sudo ln -s /usr/local/mysql/bin/* /bin/
sudo ln -s /etc/init.d/mysql.server /etc/init.d/mysql
sudo update-rc.d mysql.server defaults
sudo mkdir /var/run/mysqld
sudo chown mysql.mysql /var/run/mysqld/
sudo ln -s /tmp/mysql.sock /var/run/mysqld/mysqld.sock
sudo chmod -R 777 /usr/local/mysql/data/
sudo service mysql start
cd

echo "###########################################################"
echo "########           CREATING THE MYSQL USER          #######"
echo "###########################################################"
mysql -u root -e "CREATE USER '$VAGRANT_MYSQL_USER'@'localhost' IDENTIFIED BY '$VAGRANT_MYSQL_PWD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$VAGRANT_MYSQL_USER'@'localhost' WITH GRANT OPTION;"
