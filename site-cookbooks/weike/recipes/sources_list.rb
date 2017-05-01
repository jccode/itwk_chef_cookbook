
# update source.list
# sudo mv /etc/apt/source.list /etc/apt/source.list.orig

bash "backup origin sources.list" do
  code <<-EOL
  mv /etc/apt/sources.list /etc/apt/sources.list.orig 
  EOL
end

# chef generate template . source.list
template '/etc/apt/sources.list' do
  source 'sources.list.erb'
end
