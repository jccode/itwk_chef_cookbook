
if node['platform'] == 'ubuntu' and node['platform_version'].to_f == 16.04

  log 'Ubuntu 16.04, override attribute, use php 5.6.13'

  apt_repository 'php5' do
    uri 'ppa:ondrej/php'
  end
  
  apt_update "update"

  # override default attributes

  node.default["php"]["version"] = "5.6.13"
  node.default['php']['packages'] = %w(php5.6-cgi php5.6 php5.6-dev php5.6-cli php-pear)
  node.default['php']['modules'] = %w(php5.6-mysql php5.6-gd php5.6-fpm)


  node.default['php']['conf_dir']         = '/etc/php/5.6/cli'
  node.default['php']['fpm_package']      = 'php5.6-fpm'
  node.default['php']['fpm_pooldir']      = '/etc/php/5.6/fpm/pool.d'
  node.default['php']['fpm_service']      = 'php5.6-fpm'
  node.default['php']['fpm_socket']       = '/var/run/php/php5.6-fpm.sock'
  node.default['php']['fpm_default_conf'] = '/etc/php/5.6/fpm/pool.d/www.conf'
  
end

# log node['php']['packages']


# php
include_recipe 'php::default'

# Install a FPM pool named "default"
php_fpm_pool "default" do
  action :install
end

node['php']['modules'].each do |mod|
  package mod
end

