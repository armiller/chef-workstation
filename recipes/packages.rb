#
# Cookbook Name:: workstation
# Recipe:: packages
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#

# default packages
node['workstation']['packages'].each { |p| package p }

# Extra
node['workstation']['extra_packages'].each { |p| package p }

# remove packages
node['workstation']['remove_packages'].each do |p|
  package p do
    action :uninstall
  end
end