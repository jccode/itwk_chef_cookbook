
default['pkgs'] = %w(git emacs)

default['nginx']['default_site_enabled'] = false
default['nginx']['default_root'] = '/vagrant/src'

default['php']['modules'] = %w(php5-mysql php5-gd php5-fpm)

default['mysql']['root_password'] = 'root'
default['mysql']['db_name'] = 'mweike'
default['mysql']['db_user'] = 'weike'
default['mysql']['db_password'] = 'weike'
default['mysql']['db_file'] = '/vagrant/db/mweike.sql'
