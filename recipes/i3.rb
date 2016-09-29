#
# Cookbook Name:: chef-workstation
# Recipe:: i3
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#

# include_recipe 'chef-workstation::apt'
#
package 'xorg'
package 'xdm'
package 'i3'
