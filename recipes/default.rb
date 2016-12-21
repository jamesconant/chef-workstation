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
include_recipe 'desktop::fonts'
include_recipe 'desktop::google-chrome'
include_recipe 'desktop::heroku'
include_recipe 'workstation::i3'
include_recipe 'desktop::pc-speaker'
include_recipe 'desktop::ruby'
include_recipe 'desktop::spotify'
include_recipe 'desktop::ssh'
include_recipe 'desktop::user'
include_recipe 'desktop::vagrant' # depends on desktop::user
include_recipe 'desktop::java'
include_recipe 'desktop::sbt' # depends on desktop::java
include_recipe 'desktop::scala' # depends on desktop::java

#
# broken by upstream bug in ifupdown
#
include_recipe 'desktop::docker'
include_recipe 'workstation::slack'

package [
  :gimp,
  :inkscape,
  :keepassx,
  :vim,
  :zip,
  :cups,
  'task-print-server'
] do
  action :upgrade
  timeout 3600
end
