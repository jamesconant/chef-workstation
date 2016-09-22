#
# Cookbook Name:: chef-workstation
# Recipe:: ruby
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'chef-workstation::apt'

node.default[:rbenv][:root_path] = '/opt/rbenv'
# (Vagrant requires bundler <= 1.10.6)
node.default[:rbenv][:rubies] = [ '2.3.0' ]
node.default[:rbenv][:gems] = {
  '2.3.0' => [
    { name: 'bundler', version: '1.10.6' },
    { name: 'multipart-post' }
  ]
}

include_recipe 'ruby_build'
include_recipe 'ruby_rbenv::system'

rbenv_global '2.3.0'

ruby_block 'uninstall-old-rubies' do
  block do
    require 'mixlib/shellout'
    rbenv = node[:rbenv][:root_path] + '/bin/rbenv'

    list_command = Mixlib::ShellOut.new(rbenv,'versions', '--bare')
    list_command.run_command

    raise 'Failed to list ruby versions!' unless list_command.status.success?

    ruby_versions = list_command.stdout.split("\n")
    versions_to_remove =
        ruby_versions.reject{ |v| node[:rbenv][:rubies].include?(v) }

    versions_to_remove.each do |v|
      remove_command = Mixlib::ShellOut.new(rbenv, 'uninstall', '-f', v)
      remove_command.run_command
      raise "Failed to remove ruby #{v}!" unless remove_command.status.success?
    end
  end
end
