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
	sudo chown -R #{node['workstation']['user']}:staff /usr/local
	EOH
end

include_recipe "homebrew"

node.set['homebrew']['owner'] = node['workstation']['user']

%w{httping wget keychain git vim}.each do |pkg| 
    homebrew_package pkg
end 
