#
# Cookbook Name:: chef-workstation
# Recipe:: i3
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'chef-workstation::apt'

package 'xorg'
package 'xdm'
package 'i3'

remote_file "/tmp/yosemite_fonts.zip" do
  source 'https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip'
  # user node['desktop']['user']['name']
  # group node['desktop']['user']['group']
  not_if{ File.exists?("tmp/yosemite_fonts.zip") }
end
