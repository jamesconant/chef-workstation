#
# Cookbook Name:: chef-workstation
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

include_recipe 'chef-workstation::disable_internal_speaker'
include_recipe 'chef-workstation::apt'
include_recipe 'chef-workstation::user'
include_recipe 'chef-workstation::configs'
include_recipe 'chef-workstation::i3'

# vagrant
# virtualbox
