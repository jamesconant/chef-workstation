#
# Cookbook Name:: workstation
# Recipe:: desktop
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'workstation::default'
# broken by upstream bug in ifupdown
# include_recipe 'workstation::nvidia'
include_recipe 'desktop::steam'
include_recipe 'desktop::wine'

package [
  :mumble,
  :winetricks,
] do
  action :upgrade
  timeout 3600
end
