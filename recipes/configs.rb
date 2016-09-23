#
# Cookbook Name:: chef-workstation
# Recipe:: configs
#
# Copyright (c) 2016 James Conant, All Rights Reserved.
#

include_recipe 'chef-workstation::user'

desktop_user = node['desktop']['user']['name']
desktop_group = node['desktop']['user']['group']

# delete existing configs
["bashrc", "vimrc", "gitconfig", "git_bash_completion"].each do |config|
  template "/home/#{desktop_user}/.#{config}" do
    owner desktop_user
    group desktop_group
    source "home/#{config}"
    action :delete
  end
end

# install current configs
["bashrc", "vimrc", "gitconfig", "git_bash_completion"].each do |config|
  template "/home/#{desktop_user}/.#{config}" do
    owner desktop_user
    group desktop_group
    source "home/#{config}"
  end
end
