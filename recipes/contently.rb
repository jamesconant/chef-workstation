#
# Cookbook Name:: workstation
# Recipe:: contently
#
# Copyright (c) 2016 James Conant, All Rights Reserved.
#

include_recipe 'postgresql::client'
include_recipe 'postgresql::server'
include_recipe 'database::postgresql'

# include_recipe 'desktop::apt'
# include_recipe 'workstation::ruby'

# package 'libiconv'
# package 'libxslt'
# package 'imagemagick'
# package 'qmake-qt4'
# package 'postgresql'

# include_recipe 'desktop::user'

# postgresql_user 'contently' do
#   superuser true
#   createdb true
#   login true
#   replication true
#   password 'contently'
# end
#
# postgresql_user 'analytics' do
#   superuser true
#   createdb true
#   login true
#   replication true
#   password 'contently'
# end
#
# postgresql_database 'contently' do
#   owner 'contently'
#   encoding 'UTF-8'
#   template 'template1'
#   locale 'en_US.UTF-8'
# end
#
# postgresql_extension 'adminpack' do
#   database 'contently'
# end
#
# postgresql_extension 'hstore' do
#   database 'contently'
# end
#
# user_name = node['desktop']['user']['name']
# user_group = node['desktop']['user']['group']
# project_dir = "/home/#{user_name}/projects/contently"
#
# directory project_dir do
#   owner user_name
#   group user_group
#   mode '0755'
#   action :create
# end
#
# git project_dir do
#   repository 'git@github.com:contently/contently.git'
#   revision 'master'
#   action :sync
# end
#
# file "#{project_dir}/config/database.yml" do
#   owner user_name
#   group user_group
#   mode 0755
#   content ::File.open("#{project_dir}/config/databasebak.yml").read
#   action :create
# end


