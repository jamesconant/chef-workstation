#
# Cookbook Name:: chef-workstation
# Recipe:: i3
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#

# include_recipe 'chef-workstation::apt'
#
# package 'xorg'
# package 'xdm'
# package 'i3'

package 'unzip'
package 'rsync'

# remote_file "/tmp/yosemite_fonts.zip" do
#   source 'https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip'
#   # user node['desktop']['user']['name']
#   # group node['desktop']['user']['group']
#   not_if{ File.exists?("tmp/yosemite_fonts.zip") }
# end

ark 'YosemiteSanFranciscoFont-master' do
  url 'https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip'
  path '/usr/local/share/fonts'
  creates 'System San Francisco Display Thin.ttf'
  action :cherry_pick
end
