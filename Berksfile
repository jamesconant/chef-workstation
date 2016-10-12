source 'https://supermarket.chef.io'

#
# This wrapper cookbook is intended for itself to be wrapped as well, and not ran directly.
# Because Berkshelf does not handle nested Berksfiles (1), the desktop dependency needs to be
# specified in the top-level wrapper cookbook.
#
# (1) https://github.com/berkshelf/berkshelf/issues/1174
#
# desktop cookbook included here for test purposes.
cookbook 'desktop', git: 'git@github.com:http-418/chef-desktop'

metadata
