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

# include_recipe 'desktop::apt'
# include_recipe 'workstation::ruby'

# package 'libiconv'
# package 'libxslt'
# package 'imagemagick'
# package 'qmake-qt4'
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


