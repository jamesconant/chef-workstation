name             'workstation'
maintainer       'James Conant'
maintainer_email '<an email>'
license          'All rights reserved'
description      'Installs/Configures workstation'
# long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.5.13'

#
# This wrapper cookbook is intended for itself to be wrapped as well, and not ran directly.
# Because Berkshelf does not handle nested Berksfiles (1), the desktop dependency needs to be
# specified in the top-level wrapper cookbook.
#
# (1) https://github.com/berkshelf/berkshelf/issues/1174
#
# desktop cookbook included here for test purposes.
depends 'desktop'

depends 'apt'
depends 'ark'
depends 'debian', '~> 1.8'
depends 'java', '~> 1.0'
depends 'nodejs'
depends 'ruby_build'
depends 'ruby_rbenv'
