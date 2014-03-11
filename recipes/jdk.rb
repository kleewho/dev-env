include_recipe 'java::oracle'

template '/etc/profile.d/jdk.sh' do
  source 'jdk.sh.erb'
  mode '0755'
end
