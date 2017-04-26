name             'weike'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures weike'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt', '~> 6.1.0'
# depends 'nginx_conf', '~> 2.0.0'
depends 'chef_nginx', '~> 6.0.1'
#depends 'nginx', '~> 2.7.6'
depends 'mysql', '~> 8.3.1'
depends 'php', '~> 4.0.0'
