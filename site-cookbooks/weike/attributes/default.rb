
default['pkgs'] = %w(git emacs)

default['timezone_iii']['timezone'] = "Asia/Shanghai"

default['nginx']['default_site_enabled'] = false
default['nginx']['default_root'] = '/var/www/weike'

default['php']['version'] = "5.6.13"
default['php']['modules'] = %w(php5-mysql php5-gd php5-fpm)

default['mysql']['root_password'] = 'root'
default['mysql']['db_name'] = 'mweike'
default['mysql']['db_user'] = 'weike'
default['mysql']['db_password'] = 'weike'
default['mysql']['db_file'] = '~/mweike.sql'

default['weike']['git_repo'] = 'https://github.com/jccode/itwk.git'
