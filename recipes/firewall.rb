#
# Cookbook Name:: workstation
# Recipe:: firewall
#
# Copyright (C) 2014 Anthony Miller
#
# All rights reserved - Do Not Redistribute
#
#
node.default['simple_iptables']['ip_versions'] = ['ipv4', 'ipv6']

include_recipe "simple_iptables"

simple_iptables_policy "INPUT" do
  policy "DROP"
end

# Allow all traffic on the loopback device
simple_iptables_rule "system" do
  rule [ # Allow all traffic on the loopback device
    "--in-interface lo",
    # Allow any established connections to continue, even
    # if they would be in violation of other rules.
    "-m conntrack --ctstate ESTABLISHED,RELATED"
  ]
  jump "ACCEPT"
end

simple_iptables_rule 'icmp' do
  rule [
      "--protocol icmp --source 0/0 --icmp-type echo-request",
      "--protocol icmp --source 0/0 --icmp-type time-exceeded"
  ]
  jump "ACCEPT"
end

simple_iptables_rule "ssh" do
  rule "--proto tcp --dport 22"
  jump "ACCEPT"
end

simple_iptables_rule "weechat" do
  rule "--proto tcp --dport 8000"
  jump "ACCEPT"
end

service 'denyhosts' do
    supports :restart => true
    action [:enable, :start]
end
