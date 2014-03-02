default['dev-env']['directory'] = "/opt"
default['dev-env']['user'] = "vagrant"
default['dev-env']['vagrantfile']['directory'] = "/home/#{node['dev-env']['user']}/vagrant"

default['java']['oracle']['accept_oracle_download_terms'] = true
default['java']['java_home'] = "#{node['dev-env']['directory']}/jdk"
default['java']['install_flavor'] = "oracle"

default['maven']['m2_home'] = "#{node['dev-env']['directory']}/maven"
default['maven']['setup_bin'] = true

default['ark']['prefix_root'] = "#{node['dev-env']['directory']}"



# debian 64bit
default['dev-env']['vagrant']['ubuntu64']['url'] = "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_x86_64.deb"
default['dev-env']['vagrant']['ubuntu64']['checksum'] = "dbd06de0f3560e2d046448d627bca0cbb0ee34b036ef605aa87ed20e6ad2684b"
# debian 32bit
default['dev-env']['vagrant']['ubuntu32']['checksum'] = "66e613fc1c9e31ecaf8e5f1d07d2ae4fca3d4fc2e43593543962664258d9af9b"
default['dev-env']['vagrant']['ubuntu32']['url'] = "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_i686.deb"
# macosx
default['dev-env']['vagrant']['macosx']['checksum'] = "e7ff13b01d3766829f3a0c325c1973d15b589fe1a892cf7f857da283a2cbaed1"
default['dev-env']['vagrant']['macosx']['url'] = "https://dl.bintray.com/mitchellh/vagrant/Vagrant-1.4.3.dmg"

# windows
default['dev-env']['vagrant']['windows']['checksum'] = "78a910a5274b127496a9963839dc24860bbabdd870d00c433621801dad690469"
default['dev-env']['vagrant']['windows']['url'] = "https://dl.bintray.com/mitchellh/vagrant/Vagrant_1.4.3.msi"
default['dev-env']['vagrant']['windows']['msi_version'] = "1.4.3"

default['vagrant']['url'] = "#{node['dev-env']['vagrant']['ubuntu32']['url']}"
default['vagrant']['checksum'] = "#{node['dev-env']['vagrant']['ubuntu32']['checksum']}"
