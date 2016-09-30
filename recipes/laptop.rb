#
# Cookbook Name:: workstation
# Recipe:: laptop
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'workstation::default'
include_recipe 'workstation::intel_wifi'

package 'wicd-curses'
