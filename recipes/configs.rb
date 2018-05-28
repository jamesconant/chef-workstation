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

#
# GTK configs
#
# 3.0
#   /home/jconant/.config/gtk-3.0/settings.ini
#
# 2.0
#   /home/jconant/.gtkrc-2.0
#
#
# URVXT
#   /home/jconant/.Xresources
#
# Xft.autohint: 0
# Xft.lcdfilter: lcddefault
# Xft.hintstyle: hintslight
# Xft.hinting: 1
# Xft.rgba: rgb
# Xft.dpi: 75
#
# URxvt.font: xft:Roboto Mono Light:size=14
# URxvt.scrollBar_right: true
# URxvt.background: #D6D6CE
# URxvt.foreground: #1C1C1C
#