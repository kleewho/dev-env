include_recipe 'git'

package 'ruby'
package 'ruby-dev'
package 'rubygems'

gem_package 'bundler' do
  gem_binary '/usr/bin/gem'
end
