#
# Cookbook Name:: workstation
# Recipe:: intel_wifi
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

package 'firmware-iwlwifi'

execute 'load-iwlwifi' do
  command 'modprobe -r iwlwifi ; modprobe iwlwifi'
end
