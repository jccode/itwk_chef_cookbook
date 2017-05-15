
package 'git'

directory node['nginx']['default_root'] do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0755'
  recursive true
  action :create
end

git node['nginx']['default_root'] do
  repository node['weike']['git_repo']
  revision 'master'
  action :sync
end


# Create neccessary folder & files
%w[ data data/session data/tpl_c data/adpic data/avatar data/tmp data/uploads ].each do |path|
  directory "#{node['nginx']['default_root']}/#{path}" do
    owner node['nginx']['user']
    group node['nginx']['group']
    mode '0777'
  end
end

file "#{node['nginx']['default_root']}/data/keke_kppw_install.lck" do
  content "1038d149ef80073a86ef4644f33479d7_keke_install.lck"
  action :create
end
