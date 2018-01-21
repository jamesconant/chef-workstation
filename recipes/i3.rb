#
# Cookbook Name:: workstation
# Recipe:: i3
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

package [:i3, :xbacklight] do
  action :upgrade
  timeout 3600
end

include_recipe 'desktop::user'
desktop_user = node['desktop']['user']['name']
desktop_group = node['desktop']['user']['group']

[
  "/home/#{desktop_user}/.i3",
  "/home/#{desktop_user}/.config/i3status"
].each do |dir|
  directory dir do
    owner desktop_user
    group desktop_group
    action :create
    recursive true
    mode 0755
  end
end

template "/home/#{desktop_user}/.i3/config" do
  owner desktop_user
  group desktop_group
  source "home/i3"
end

template "/home/#{desktop_user}/.config/i3status/config" do
  owner desktop_user
  group desktop_group
  source 'home/i3status.erb'
  variables({
    likely_laptop: system(
      'lspci | grep "Intel Corporation Centrino Ultimate-N 6300"'
    )
  })
end
