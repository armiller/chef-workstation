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
	EOH
    not_if "which brew"
end

include_recipe "homebrew"

node.set['homebrew']['owner'] = node['workstation']['user']

node['workstation']['packages'].each do |pkg| 
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

dmg_package "Sublime Text 2" do
    volumes_dir "Sublime Text 2.0.2" 
    source "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg"
    action :install
end 

dmg_package 'Google Chrome' do
  dmg_name 'googlechrome'
  source   'https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg'
  checksum '7daa2dc5c46d9bfb14f1d7ff4b33884325e5e63e694810adc58f14795165c91a'
  action   :install
end

include_recipe "iterm2"
include_recipe "macapps::virtualbox"
include_recipe "macapps::vagrant"
include_recipe "macapps::firefox"
include_recipe "macapps::caffeine"
