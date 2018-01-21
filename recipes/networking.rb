#
# Cookbook Name:: workstation
# Recipe:: networking
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

#
# Only setup Intel wireless drivers and wicd when intel chipset present
#
if system('lspci | grep "Intel Corporation Centrino Ultimate-N 6300"')
  include_recipe 'workstation::intel_wifi'
  package 'wicd-curses'
else
  log 'This system does not contain an approved Intel wireless chipset'
end
