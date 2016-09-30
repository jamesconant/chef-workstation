#
# Cookbook Name:: workstation
# Recipe:: user
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#

node['desktop']['user'].tap do |user|
  group user['group'] do
    gid user['gid']
  end

  user user['name'] do
    comment "administrator"
    uid user['uid']
    gid user['group']
    home user['home']
    shell '/bin/bash'
    manage_home false
  end

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

  file "/etc/sudoers.d/#{user['name']}" do
    user 'root'
    group 'root'
    mode 0440
    content <<-EOM.gsub(/^ {6}/,'')
      # This file is maintained by Chef.
      # Local changes will be overwritten.
      #{user['name']} ALL=(ALL:ALL) NOPASSWD: ALL
    EOM
  end
end

file "/etc/sudoers.d/proxy" do
  user 'root'
  group 'root'
  mode 0440
  content <<-EOM.gsub(/^ {6}/,'')
      # This file is maintained by Chef.
      # Local changes will be overwritten.
      Defaults env_keep += "http_proxy https_proxy"
  EOM
end
