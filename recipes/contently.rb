#
# Cookbook Name:: workstation
# Recipe:: contently
#
# Copyright (c) 2016 James Conant, All Rights Reserved.
#

include_recipe 'postgresql::client'
include_recipe 'postgresql::server'
include_recipe 'database::postgresql'

postgresql_connection_info = {
  :host     => '127.0.0.1',
  :port     => node['postgresql']['config']['port'],
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
}

postgresql_database_user 'contently' do
  connection postgresql_connection_info
  password 'contently'
  action :create
end

postgresql_database 'contently' do
  connection postgresql_connection_info
  owner 'contently'
  action :create
end

postgresql_database_user 'contently' do
  connection postgresql_connection_info
  database_name 'contently'
  privileges [:all]
  action :grant
end

execute "install postgres contrib" do
  action :run
  command "apt-get -y install postgresql-contrib-9.4"
end

execute "hstore extension on contently" do
  command 'sudo -u postgres psql -d contently -c "CREATE EXTENSION IF NOT EXISTS hstore";'
  action :run
end

execute "adminpack extension on contently" do
  command 'sudo -u postgres psql -d contently -c "CREATE EXTENSION IF NOT EXISTS adminpack";'
  action :run
end

include_recipe 'desktop::user'

user_name = node['desktop']['user']['name']
user_group = node['desktop']['user']['group']
project_dir = "/home/#{user_name}/projects/contently"

directory project_dir do
  owner user_name
  group user_group
  mode '0755'
  recursive true
  action :create
end

git_client 'default' do
  action :install
end

directory "/home/#{user_name}/.ssh" do
  owner user_name
  group user_group
  mode '0755'
  recursive true
  action :create
end

Debugging
chef_gem 'pry'
require 'pry'

binding.pry

template "/home/#{user_name}/.ssh/contently_rsa.pub" do
  source "id_rsa.pub.erb"
  owner user_name
  mode 0600
  variables({ :pub_key => node[:ssh][:contently][:pub_key] })
end

template "/home/#{user_name}/.ssh/contently_rsa" do
  source "id_rsa.erb"
  owner user_name
  mode 0600
  variables({ :priv_key => node[:ssh][:contently][:priv_key] })
end

git project_dir do
  # repository 'git@github.com:contently/contently.git'
  repository "ext::ssh -i /home/#{user_name}/.ssh/contently_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no git@github.com:contently/contently.git"
  revision 'master'
  action :sync
end

# include_recipe 'desktop::apt'
# include_recipe 'workstation::ruby'

# package 'libiconv'
# package 'libxslt'
# package 'imagemagick'
# package 'qmake-qt4'
#
#
# file "#{project_dir}/config/database.yml" do
#   owner user_name
#   group user_group
#   mode 0755
#   content ::File.open("#{project_dir}/config/databasebak.yml").read
#   action :create
# end


