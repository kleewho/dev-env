name             'dev-env'
maintainer       'Lukasz Klich'
maintainer_email 'klich.lukasz@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures whatever I need in my work'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

supports 'ubuntu'

depends 'java'
depends 'maven'
depends 'vagrant'
depends 'virtualbox'
depends 'git'
depends 'idea'
