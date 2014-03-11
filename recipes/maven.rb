include_recipe 'maven'

template '/etc/profile.d/maven.sh' do
  source 'maven.sh.erb'
  mode '0755'
end
