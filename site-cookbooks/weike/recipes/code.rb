

git node['nginx']['default_root'] do
  repository node['weike']['git_repo']
  revision 'master'
  action :sync
end

directory "#{node['nginx']['default_root']}/data" do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0777'
end
