#
# Cookbook Name:: chef-workstation
# Recipe:: default
#
# Copyright 2016, James Conant
#
# All rights reserved - Do Not Redistribute
#

#
# Force apt to keep your old configuration files when possible,
# instead of prompting for you to make a decision.
#
file '/etc/apt/apt.conf.d/02dpkg-options' do
  mode 0444
  content <<-EOM.gsub(/^ {4}/,'')
    Dpkg::Options {
      "--force-confdef";
      "--force-confold";
    }
  EOM
end
