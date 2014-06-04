case['hostname'] 
when 'Pippen'
	default['workstation']['user'] = "Knifeninjas"
else
	default['workstation']['user'] = "armiller"
end

default['iptables-ng']['enabled_ip_versions'] = 4
