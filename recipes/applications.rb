#
# Cookbook Name:: workstation
# Recipe:: applications
#
# Copyright 2017, James Conant
#
# All rights reserved - Do Not Redistribute
#

package [
  :gimp,
  :inkscape,
  :keepassx,
  :vim,
  :zip,
  :cups,
  'task-print-server',
  :mumble,
  :terminator,
  :ntp,
  :dtrx
] do
  action :upgrade
  timeout 3600
end
