#
# Cookbook Name:: workstation
# Recipe:: configs
#
# Copyright (c) 2018 James Conant, All Rights Reserved.
#

include_recipe 'desktop::user'

desktop_user = node['desktop']['user']['name']
desktop_group = node['desktop']['user']['group']

raise "MissingHostName" unless node[:host][:name]

[
  'bashrc.erb',
  'vimrc',
  'gitconfig',
  'git_bash_completion',
  'terminator'
].each do |conf|
  template "/home/#{desktop_user}/.#{conf.gsub('.erb', '')}" do
    owner desktop_user
    group desktop_group
    source "home/#{conf}"
    variables({ :user_name => desktop_user, :host_name => node[:host][:name] })
  end
end
