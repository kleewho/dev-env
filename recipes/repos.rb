include_recipe "git"

user = node['dev-env']['user']
projects_d = node['dev-env']['liberty-global']['directory']

unless ::File.exists?(projects_d)
  Chef::Log.info "Creating #{projects_d}"
  require 'fileutils'
  FileUtils.mkdir projects_d, :mode => 0755
  FileUtils.chown user, user, projects_d
end


node['dev-env']['liberty-global']['projects'].each do |repo|
  git repo do
    repository "#{node['dev-env']['liberty-global']['url']}/#{repo}.git"
    revision "master"
    user user
    group user
    destination "#{projects_d}/#{repo}"
    action :checkout
  end
end
