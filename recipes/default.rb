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
# Halt run of recipes if not on a reasonably modern kernel. There is probably a
# less stupid way to do this.
#
if `uname -r`[0].to_i < 4
  raise StandardError,
        'Please upgrade to a somewhat modern kernel, such as 4.x'
end

#
# Base
#
include_recipe 'desktop::apt'
# include_recipe 'desktop::backports'
include_recipe 'workstation::configs'
include_recipe 'desktop::user'

#
# System
#
include_recipe 'desktop::fonts'
include_recipe 'desktop::pc-speaker'
include_recipe 'workstation::audio'
include_recipe 'desktop::ssh'
include_recipe 'workstation::graphics'
include_recipe 'workstation::networking'
include_recipe 'workstation::i3'

#
# Languages
#
# include_recipe 'desktop::ruby'
# include_recipe 'desktop::java'
# include_recipe 'desktop::scala'
# include_recipe 'desktop::sbt'

#
# Applications
#
include_recipe 'workstation::applications'
# include_recipe 'desktop::google-chrome'
include_recipe 'desktop::spotify'
include_recipe 'desktop::slack'
include_recipe 'workstation::games'

#
# Tools
#
include_recipe 'desktop::heroku'
include_recipe 'desktop::docker'
