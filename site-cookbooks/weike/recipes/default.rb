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

# timezone
include_recipe 'timezone_iii::default'

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
# ##############################

# Create service
mysql_service 'mweike' do
  port '3306'
  version '5.5'
  initial_root_password node['mysql']['root_password']
  action [:create, :start]
end

mysql2_chef_gem 'default' do
  action :install
end

# Connection info
mysql_connection_info = {
  :host     => '127.0.0.1',
  :username => 'root',
  :password => node['mysql']['root_password']
}

# Create a mysql database 'mweike'
mysql_database node['mysql']['db_name'] do
  connection mysql_connection_info
  action :create
end

# Create database user
mysql_database_user node['mysql']['db_user'] do
  connection    mysql_connection_info
  password      node['mysql']['db_password']
  database_name node['mysql']['db_name']
  host          '%'
  privileges    [:select,:update,:insert,:delete]
  action        :grant
end


# Create a path to the SQL file in the Chef cache.
# create_tables_script_path = File.join(Chef::Config[:file_cache_path], 'create-tables.sql')

# Write the SQL script to the filesystem.
# cookbook_file create_tables_script_path do
#   source 'create-tables.sql'
#   owner 'root'
#   group 'root'
#   mode '0600'
# end


# Import database
execute "initialize #{node['mysql']['dbname']} database" do
  command "mysql -h 127.0.0.1 -u root -p#{node['mysql']['root_password']} -D #{node['mysql']['db_name']} < #{node['mysql']['db_file']}"
  not_if  "mysql -h 127.0.0.1 -u root -p#{node['mysql']['root_password']} -D #{node['mysql']['db_name']} -e 'describe keke_witkey_task;'"
end
