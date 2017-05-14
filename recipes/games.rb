#
# Cookbook Name:: workstation
# Recipe:: games
#
# Copyright 2017, James Conant
#
# All rights reserved - Do Not Redistribute
#

#
# Assume that if we have an nvidia card we want some games...
#
if system('lspci | grep VGA | grep -i nvidia')
  include_recipe 'desktop::steam'
  # Starcraft 2 recipe?
else
  log 'This system does not contain an nVidia GPU. Not installing games.'
end