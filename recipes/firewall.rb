#
# Cookbook Name:: workstation
# Recipe:: firewall
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#
case['platform_family']
when 'debian'
    iptables_ng_chain 'INPUT' do
        policy 'DROP'
    end

    # Setup chains and jumps for rules
    %w{loopback established icmp ssh}.each do |chain| 
        iptables_ng_chain "#{chain}"
        iptables_ng_rule "accept_#{chain}" do
            rule "--jump #{chain}"
        end
    end

    iptables_ng_rule 'loopback' do
        rule '--in-interface lo --jump ACCEPT'
        chain 'loopback'
    end

    iptables_ng_rule 'established' do
        rule '--match conntrack --ctstate ESTABLISHED,RELATED --jump ACCEPT'
        chain 'established'
    end

    iptables_ng_rule 'icmp' do
        rule ['--protocol icmp --source 0/0 --icmp-type echo-request --jump ACCEPT', 
            '--protocol icmp --source 0/0 --icmp-type time-exceeded --jump ACCEPT']
        chain 'icmp'
    end

    iptables_ng_rule 'ssh' do
        rule '--protocol tcp --destination-port 22 --jump ACCEPT'
        chain 'ssh'
    end 
end
