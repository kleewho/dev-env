default['dev-env']['directory'] = "/opt"
default['dev-env']['user'] = "vagrant"

default['java']['oracle']['accept_oracle_download_terms'] = true
default['java']['java_home'] = "#{node['dev-env']['directory']}/jdk"
default['java']['install_flavor'] = "oracle"

default['maven']['m2_home'] = "#{node['dev-env']['directory']}/maven"
default['maven']['setup_bin'] = true

default['ark']['prefix_root'] = "#{node['dev-env']['directory']}"
