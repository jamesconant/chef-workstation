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

include_recipe 'desktop::apt'
include_recipe 'workstation::configs'
include_recipe 'desktop::docker'
include_recipe 'desktop::fonts'
include_recipe 'desktop::google-chrome'
# include_recipe 'desktop::heroku' -- currently broken
include_recipe 'workstation::i3'
include_recipe 'desktop::java'
include_recipe 'desktop::pc-speaker'
include_recipe 'workstation::ruby'
include_recipe 'desktop::sbt'
include_recipe 'desktop::scala'
include_recipe 'desktop::slack'
include_recipe 'desktop::spotify'
include_recipe 'desktop::ssh'
include_recipe 'desktop::user'
include_recipe 'desktop::vagrant'

package [
  :gimp,
  :inkscape,
  :keepassx,
  :mumble,
  :winetricks,
  :vim,
  :zip
] do
  action :upgrade
  timeout 3600
end
