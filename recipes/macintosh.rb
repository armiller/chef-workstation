#
# Cookbook Name:: workstation
# Recipe:: macintosh
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#

bash "prepare-homebrew" do 
	user node['workstation']['user'] 
	code <<-EOH
	chown -R #{node['workstation']['user']}:staff /usr/local
    touch /Users/#{node['workstation']['user']}/.brewrun
	EOH
    not_if "test -f /Users/#{node['workstation']['user']}/.brewrun"
end

include_recipe "homebrew"

node.set['homebrew']['owner'] = node['workstation']['user']

%w{httping wget keychain git vim}.each do |pkg| 
    package pkg do 
        action :install
    end
end 

include_recipe "dmg" 

dmg_package "Adium" do 
    volumes_dir "Adium 1.5.10"
    source "http://downloads.sourceforge.net/project/adium/Adium_1.5.10.dmg?r=&ts=1403291553&use_mirror=iweb"
    action :install
end 
