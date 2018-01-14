#
# Cookbook Name:: workstation
# Recipe:: graphics
#
# Copyright 2017, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'desktop::apt'

package ['xserver-xorg', 'pciutils']

directory '/etc/X11/xorg.conf.d/' do
  recursive true
  mode 0555
end

# Don't configure nvidia drivers on non-nvidia systems.
if system('lspci | grep VGA | grep -i nvidia')
  include_recipe 'desktop::nvidia'
  package 'xserver-xorg'
else
  log 'This system does not contain an nVidia GPU'
  file '/etc/X11/xorg.conf.d/20-nvidia.conf' do
    action :delete
  end
  package 'xserver-xorg-video-all'
end

#
# desktop::graphics is currently broken for DM-less cookbooks
# https://github.com/http-418/chef-desktop/issues/17
#
# include_recipe 'desktop::graphics'
package 'xorg'
