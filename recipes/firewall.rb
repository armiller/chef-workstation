#
# Cookbook Name:: workstation
# Recipe:: firewall
#
# Copyright (C) 2014 Anthony Miller
#
# All rights reserved - Do Not Redistribute
#
#

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

simple_iptables_rule "ssh" do
  rule "--proto tcp --dport 22"
  jump "ACCEPT"
end
