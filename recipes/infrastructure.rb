include_recipe 'git'

user = node['dev-env']['user']
projects_d = node['dev-env']['liberty-global']['directory']

unless ::File.exists?(projects_d)
  Chef::Log.info "Creating #{projects_d}"
  require 'fileutils'
  FileUtils.mkdir projects_d, :mode => 0755
  FileUtils.chown user, user, projects_d
end

infrastructure = 'infrastructure'

git infrastructure do
  repository "#{node['dev-env']['liberty-global']['url']}/#{infrastructure}.git"
  revision 'master'
  user user
  group user
  destination "#{projects_d}/#{infrastructure}"
  action :checkout
end

case node['platform_family']
when 'debian'
  package 'ruby1.9.3'
  package 'libxml2-dev'
  package 'libxslt1-dev'
end

gem_package 'bundler' do
  gem_binary '/usr/bin/gem'
end

execute 'bundle install' do
  cwd "#{projects_d}/#{infrastructure}/provisioning"
end
