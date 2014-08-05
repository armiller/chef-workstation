#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#

service "fail2ban" do
    supports :restart => true, :start => true, :stop => true
    action [:enable, :start]
end

service "fail2ban" do
  action :restart
  not_if "iptables -S | grep fail2ban"
end
