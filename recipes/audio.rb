#
# Cookbook Name:: workstation
# Recipe:: audio
#
# Copyright 2017, James Conant
#
# All rights reserved - Do Not Redistribute
#

package [:pulseaudio, :pavucontrol] do
  action :upgrade
  timeout 3600
end
