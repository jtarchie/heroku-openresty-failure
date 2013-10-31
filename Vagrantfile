# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provision :shell, :inline => <<-SH
    sudo bash
    apt-get update
    apt-get install libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make siege
    wget http://openresty.org/download/ngx_openresty-1.4.2.8.tar.gz
    tar xzvf ngx_openresty-1.4.2.8.tar.gz
    cd ngx_openresty-1.4.2.8/
    ./configure --with-luajit
    make
    make install
  SH

end
