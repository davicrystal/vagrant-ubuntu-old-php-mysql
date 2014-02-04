VAGRANT ENVIRONMENT FOR UBUNTU 13.X WITH OLD VERSIONS OF PHP AND MYSQL
========

Do you have problems creating an Ubuntu environment with old versions of PHP and MYSQL using the Vagrant? This shell script screenplay will help you to install the old version of PHP and MYSQL in a Vagrant Ubuntu environment.

GET STARTED
========

Checkout this repository in your Vangrant environment folder and in your vagrant configuration file set the variable for provision file the bootstrap.sh inside the repository folder, like that:

EXEMPLE: config.vm.provision :shell, :path => "respository_path/bootstrap.sh"

CONFIGURANTION
========

You can open the bootstrap.sh file and change the sources of the PHP and MYSQL to get other versions of these. You can also change other variables to custom your own environment.

REQUIREMENT

- FOR VAGRANT USE ONLY / Vagrant version (1.4.3)
- Ubuntu 13.x AMD64
- The project got this Vagrant Box: http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box

