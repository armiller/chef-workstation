#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#
case['platform_family']
when 'mac_os_x'
    home = "/Users/"
else 
    home = "/home/"
end

home = home + node['workstation']['user']

%w{vimrc bashrc}.each do |fl| 
    template "#{home}/.#{fl}" do 
        owner node['workstation']['user']
        group node['workstation']['user']
        action :create
    end 
end 
