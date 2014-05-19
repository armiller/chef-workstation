case['hostname'] 
when 'Pippen'
	default['workstation']['user'] = "Knifeninjas"
else
	default['workstation']['user'] = "armiller"
end