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

# nginx
include_recipe 'chef_nginx::default'

# mysql
mysql_service 'mweike' do
  port '3306'
  version '5.5'
  initial_root_password 'root'
  action [:create, :start]
end
