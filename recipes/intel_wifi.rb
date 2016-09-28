#
# Cookbook Name:: chef-workstation
# Recipe:: intel_wifi
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'chef-workstation::apt'

package 'firmware-iwlwifi'

execute 'load-iwlwifi' do
  command 'modprobe -r iwlwifi ; modprobe iwlwifi'
end
