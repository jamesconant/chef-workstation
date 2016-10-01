#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#
# Debugging
# chef_gem 'pry'
# require 'pry'

#
# This workbook only supports Debian
#
unless node['platform'] == 'debian'
  raise "Unsupported platform: #{node['platform']}"
end

include_recipe 'desktop::pc-speaker'
include_recipe 'desktop::apt'
include_recipe 'workstation::user'
include_recipe 'workstation::configs'
include_recipe 'workstation::i3'
include_recipe 'workstation::ruby'

package 'vim'
