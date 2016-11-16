# Vagrant VM setup

1. Instalar VirtualBox (https://www.virtualbox.org/wiki/Downloads)
1. Instalar Vagrant (https://www.vagrantup.com/downloads.html)
1. Instalar berkshelf: `gem install berkshelf --no-ri --no-rdoc`
1. Instalar plugin de vagrant vagrant-omnibus: `vagrant plugin install vagrant-omnibus`
1. Instalar cookbooks: `berks vendor cookbooks`
1. Generar la VM: `vagrant up`