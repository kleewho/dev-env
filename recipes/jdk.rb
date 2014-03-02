include_recipe 'java::oracle'

file '/etc/profile.d/jdk.sh' do
  content "export JAVA_HOME=#{node['java']['java_home']}
export PATH=#{node['java']['java_home']}/bin:$PATH"
  mode 00755
end
