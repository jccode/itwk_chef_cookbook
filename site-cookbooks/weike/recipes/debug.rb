
log 'debug recipe'

if node['platform'] == 'ubuntu' and node['platform_version'].to_f == 16.04
  log 'ubuntu 16.04'
end

if node['platform'] == 'ubuntu' and node['platform_version'].to_f == 12.04
  log 'ubuntu 12.04'
end

if node['platform'] == 'ubuntu' and node['platform_version'].to_f.between?(12.04,15.10)
  log 'ubuntu between 12.04~15.10'
end

log node['mysql']['db_file']
