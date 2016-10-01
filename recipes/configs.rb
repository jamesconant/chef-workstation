#
# Cookbook Name:: workstation
# Recipe:: configs
#
# Copyright (c) 2016 James Conant, All Rights Reserved.
#

include_recipe 'desktop::user'

desktop_user = node['desktop']['user']['name']
desktop_group = node['desktop']['user']['group']

["bashrc", "vimrc", "gitconfig", "git_bash_completion"].each do |config|
  template "/home/#{desktop_user}/.#{config}" do
    owner desktop_user
    group desktop_group
    source "home/#{config}.erb"
    variables({ :home_dir => node[:desktop][:user][:home],
                :host_name => node[:host][:name] })
  end
end
