include_recipe "vagrant"

user = node['dev-env']['user']
vagrantfile_d = "#{node['dev-env']['vagrantfile']['directory']}"


unless ::File.exists?(vagrantfile_d)
  Chef::Log.info "Creating #{vagrantfile_d}"
  require 'fileutils'
  FileUtils.mkdir vagrantfile_d, :mode => 0755
  FileUtils.chown user, user, vagrantfile_d
end


cookbook_file "#{vagrantfile_d}/Vagrantfile" do
  source "Vagrantfile"
  owner user
  group user
  mode 0644
end
