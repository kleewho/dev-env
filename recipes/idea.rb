user = node['dev-env']['user']
idea_d = "/home/#{user}/.m2/"

unless ::File.exists?(idea_d)
  Chef::Log.info "Creating #{idea_d}"
  require 'fileutils'
  FileUtils.mkdir idea_d, :mode => 0755
  FileUtils.chown user, user, idea_d
end

include_recipe 'idea'
