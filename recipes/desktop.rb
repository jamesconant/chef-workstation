#
# Cookbook Name:: workstation
# Recipe:: desktop
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'workstation::default'
include_recipe 'workstation::nvidia'
include_recipe 'desktop::steam'
include_recipe 'desktop::wine'

package [
  :mumble,
  :winetricks,
] do
  action :upgrade
  timeout 3600
end
