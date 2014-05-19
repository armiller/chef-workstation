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
    include_recipe 'workstation::macintosh'
end
