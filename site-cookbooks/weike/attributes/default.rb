
default['pkgs'] = %w(git emacs)

default['nginx']['default_site_enabled'] = false
default['nginx']['default_root'] = '/vagrant/src'

default['php']['modules'] = %w(php5-mysql php5-gd php5-fpm)

