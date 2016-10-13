# this is just a temp recipe until a patch to desktop::ruby is merged

node.default[:rbenv][:root_path] = '/opt/rbenv'
node.default[:rbenv][:rubies] = [ '2.1.7' ]

# Install bundler gem in every ruby.
# (Vagrant requires bundler <= 1.10.6)
node.default[:rbenv][:gems] = node[:rbenv][:rubies]
  .map { |v| { v => [
    { 'name' => 'bundler', 'version' => '1.10.6' },
    { 'name' => 'multipart-post'}
] } }
.reduce({}, :merge)

include_recipe 'ruby_build'
include_recipe 'ruby_rbenv::system'

rbenv_global '2.1.7'

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
