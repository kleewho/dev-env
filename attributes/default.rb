default['dev-env']['directory'] = '/opt'
default['dev-env']['user'] = 'vagrant'

default['dev-env']['vagrantfile']['directory'] = "/home/#{node['dev-env']['user']}/vagrant"

default['dev-env']['liberty-global']['projects'] = ['customer-api',
                                                    'customer-api-acceptance-tests',
                                                    'customer-api-adapter-client',
                                                    'customer-api-adapter-model',
                                                    'customer-api-dropwizard-adapter',
                                                    'customer-integration',
                                                    'epg-importer-dropwizard',
                                                    'infrastructure',
                                                    'kraken-domain',
                                                    'peal-client',
                                                    'schedule-api-v1',
                                                    'schedule-api-v2',
                                                    'schedule-api-v2-dropwizard',
                                                    'social-api-client',
                                                    'social-api-dropwizard',
                                                    'social-api-model',
                                                    'tentacle']
default['dev-env']['liberty-global']['directory'] = "/home/#{node['dev-env']['user']}/projects"
default['dev-env']['liberty-global']['url'] = 'git@github.com:LibertyGlobal'


default['java']['oracle']['accept_oracle_download_terms'] = true
default['java']['java_home'] = "#{node['dev-env']['directory']}/jdk"
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '7'

default['maven']['m2_home'] = "#{node['dev-env']['directory']}/maven"
default['maven']['setup_bin'] = true

default['ark']['prefix_root'] = "#{node['dev-env']['directory']}"

case node['platform_family']
when "windows"
  default['dev-env']['vagrant']['checksum'] = '78a910a5274b127496a9963839dc24860bbabdd870d00c433621801dad690469'
  default['dev-env']['vagrant']['url'] = 'https://dl.bintray.com/mitchellh/vagrant/Vagrant_1.4.3.msi'
  default['dev-env']['vagrant']['msi_version'] = '1.4.3'
when "macosx"
  default['dev-env']['vagrant']['macosx']['checksum'] = 'e7ff13b01d3766829f3a0c325c1973d15b589fe1a892cf7f857da283a2cbaed1'
  default['dev-env']['vagrant']['macosx']['url'] = 'https://dl.bintray.com/mitchellh/vagrant/Vagrant-1.4.3.dmg'
when "debian"
  if kernel['machine'] =~ /x86_64/
    default['dev-env']['vagrant']['url'] = 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_x86_64.deb'
    default['dev-env']['vagrant']['checksum'] = 'dbd06de0f3560e2d046448d627bca0cbb0ee34b036ef605aa87ed20e6ad2684b'
  else
    default['dev-env']['vagrant']['checksum'] = '66e613fc1c9e31ecaf8e5f1d07d2ae4fca3d4fc2e43593543962664258d9af9b'
    default['dev-env']['vagrant']['url'] = 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_i686.deb'
  end
end

default['vagrant']['url'] = "#{node['dev-env']['vagrant']['url']}"
default['vagrant']['checksum'] = "#{node['dev-env']['vagrant']['checksum']}"
case node['platform_family']
when "windows"
  default['vagrant']['msi_version'] = "#{node['dev-env']['vagrant']['msi_version']}"
end

default['virtualbox']['version'] = '4.3'

default['idea']['setup_dir'] = "/home/#{node['dev-env']['user']}"
default['idea']['user'] = "#{node['dev-env']['user']}"
default['idea']['group'] = "#{node['dev-env']['user']}"
