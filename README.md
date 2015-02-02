VAGRANT FOR OLD PHP AND MYSQL
========

**VAGRANT ENVIRONMENT FOR UBUNTU 13.X WITH OLD VERSIONS OF PHP AND MYSQL**. Do you have problems creating an Ubuntu environment with old versions of PHP and MYSQL using the Vagrant? This shell script screenplay will help you to install the old version of PHP and MYSQL in a Vagrant Ubuntu environment.

CONFIGURATION
========

**You need to open the bootstrap.sh file and to configure the work paths** and if you want, change the sources of the PHP and MYSQL to get other versions of these. You can also change other variables to customize your own environment.

You can use the file **custom-install.sh** in the **screenplay** folder to put your own customized procedures

GET STARTED
========

Checkout this repository in your Vangrant environment folder and in your vagrant configuration file set the variable for provision the file bootstrap.sh inside the repository folder, like that:

```php
config.vm.provision :shell, :path => "respository_path/bootstrap.sh
```

REQUIREMENTS
========

- FOR VAGRANT USE ONLY / Vagrant version (1.4.3)
- Ubuntu 14.04
- The project got this Vagrant Box: ubuntu/trusty64

AUTHOR
=========
DAVI CRYSTAL / davicrystal@gmail.com / http://twitter.com/davicrystal

