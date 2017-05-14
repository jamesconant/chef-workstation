#
# Cookbook Name:: workstation
# Recipe:: configs
#
# Copyright (c) 2017 James Conant, All Rights Reserved.
#


#
# TODO This recipe should be cleaned up / reconsidered.
# - i3 config is located with i3 recipe
#

include_recipe 'desktop::user'

desktop_user = node['desktop']['user']['name']
desktop_group = node['desktop']['user']['group']

raise "MissingHostName" unless node[:host][:name]

["bashrc.erb", "vimrc", "gitconfig", "git_bash_completion"].each do |config|
  template "/home/#{desktop_user}/.#{config}" do
    owner desktop_user
    group desktop_group
    source "home/#{config}"
    variables({ :user_name => desktop_user,
                :host_name => node[:host][:name] })
  end
end
