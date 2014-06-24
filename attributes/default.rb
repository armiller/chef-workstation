case['hostname'] 
when 'Pippen'
	default['workstation']['user'] = "Knifeninjas"
else
	default['workstation']['user'] = "armiller"
end

default['iptables-ng']['enabled_ip_versions'] = 4

default['workstation']['packages'] = %w{vim git keychain wget iotop htop}
