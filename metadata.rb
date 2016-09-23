name             'chef-workstation'
maintainer       'James Conant'
maintainer_email 'jfaconant@gmail.com'
license          'All rights reserved'
description      'Installs/Configures chef-workstation'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.5.0'

depends 'debian', '~> 1.8'
depends 'ruby_build'
depends 'ruby_rbenv'
