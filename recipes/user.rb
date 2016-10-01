#
# Cookbook Name:: workstation
# Recipe:: user
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'desktop::user'

user = node['desktop']['user']

# delete default directories created by desktop::user
# directories_to_delete = [
#   'Desktop',
#   'Downloads',
#   'Documents',
#   'Music',
#   'Pictures',
#   'Public',
#   'Templates',
#   'Videos'
# ]
#
# directories_to_delete.each do |dir|
#   directory user['home'] + "/#{dir}" do
#     recursive true
#     action :delete
#   end
# end

directories = [
  '.kdb',
  '.ssh',
  'bin',
  'doc',
  'dls',
  'prj',
  'tmp'
]

directories.each do |dir|
  directory user['home'] + "/#{dir}" do
    owner user['name']
    group user['group']
    mode 0700
  end
end
