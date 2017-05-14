#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright 2017, James Conant
#
# All rights reserved - Do Not Redistribute
#

#
# Debugging
# chef_gem 'pry'
# require 'pry'
#

#
# This workbook only supports Debian
#
unless node['platform'] == 'debian'
  raise "Unsupported platform: #{node['platform']}"
end

#
# Base
#
include_recipe 'desktop::apt'
include_recipe 'desktop::backports'
include_recipe 'workstation::configs'
include_recipe 'desktop::user'

#
# System
#
include_recipe 'desktop::fonts'
include_recipe 'desktop::pc-speaker'
include_recipe 'desktop::ssh'
include_recipe 'workstation::graphics'
include_recipe 'workstation::networking'

#
# Languages
#
include_recipe 'desktop::ruby'
include_recipe 'desktop::java'
include_recipe 'desktop::scala'
include_recipe 'desktop::sbt'

#
# Applications
#
include_recipe 'workstation::applications'
include_recipe 'desktop::google-chrome'
include_recipe 'desktop::spotify'
include_recipe 'desktop::slack'
include_recipe 'workstation::games'

#
# Tools
#
include_recipe 'desktop::heroku'
# include_recipe 'desktop::vagrant'
# include_recipe 'desktop::docker' -> very fragile, complains about aufs everytime, not idempotent
