#
# Cookbook Name:: chef-workstation
# Recipe:: laptop
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'chef-workstation::default'
include_recipe 'chef-workstation::intel_wifi'

package 'wicd-curses'
