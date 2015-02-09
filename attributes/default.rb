case['hostname']
when 'Pippen'
  default['workstation']['user'] = "Knifeninjas"
else
  default['workstation']['user'] = "armiller"
end


default['workstation']['packages'] = %w{vim git keychain wget iotop htop}
