#
# Cookbook Name:: weike
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# update source.list
# sudo mv /etc/apt/source.list /etc/apt/source.list.orig

bash "backup origin sources.list" do
  code <<-EOL
  mv /etc/apt/sources.list /etc/apt/sources.list.orig 
  EOL
end

# chef generate template . source.list
template '/etc/apt/sources.list' do
  source 'sources.list.erb'
end


# apt-update
include_recipe 'apt::default'

# install your favorite packages
node['pkgs'].each do |pkg|
  package pkg
end

# php
include_recipe 'php::default'

# Install a FPM pool named "default"
php_fpm_pool "default" do
  action :install
end

node['php']['modules'].each do |mod|
  package mod
end


# nginx
include_recipe 'chef_nginx::default'

nginx_site 'mweike' do
  template 'nginx-site.erb'
end


# mysql
mysql_service 'mweike' do
  port '3306'
  version '5.5'
  initial_root_password 'root'
  action [:create, :start]
end
