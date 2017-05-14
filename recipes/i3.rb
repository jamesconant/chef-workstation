#
# Cookbook Name:: workstation
# Recipe:: i3
#
# Copyright 2017, James Conant
#
# All rights reserved - Do Not Redistribute
#

package 'xorg'
package 'xdm'
package 'i3'

include_recipe 'desktop::user'
desktop_user = node['desktop']['user']['name']
desktop_group = node['desktop']['user']['group']

directory "/home/#{desktop_user}/.i3" do
  owner desktop_user
  group desktop_group
  action :create
  mode 0755
end

template "/home/#{desktop_user}/.i3/config" do
  owner desktop_user
  group desktop_group
  source "home/i3"
  variables({ :home_dir => node[:desktop][:user][:home],
              :host_name => node[:host][:name] })
end
