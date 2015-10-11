# Class: nodejs
#
# This class installs the nodejs tarball
#
# Parameters:
#
#  version: (default 4.1.2)
#    Specify the version to be downloaded
#
#  source: (default https://nodejs.org/dist)
#    Override the URL to download tarball
#
# Actions:
#   - Installs the nodejs official tarball
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'nodejs':
#      version => '4.1.2'
#    }
#
class nodejs (
  $version = '4.1.2',
  $source = 'https://nodejs.org/dist'
){
  exec { 'get-nodejs':
    path    => '/bin:/usr/bin',
    command => "wget ${source}/v${version}/node-v${version}-linux-x64.tar.gz",
    cwd     => '/tmp',
    creates => "/tmp/node-v${version}-linux-x64.tar.gz",
    timeout => 10000,
    onlyif  => "test ! -d /usr/local/node-v${version}-linux-x64",
  }

  exec { 'untar-nodejs':
    path    => '/bin:/usr/bin',
    command => "tar -zxf /tmp/node-v${version}-linux-x64.tar.gz",
    cwd     => '/usr/local',
    creates => "/usr/local/node-v${version}-linux-x64",
    timeout => 10000,
    require => Exec['get-nodejs'],
  }

  file { "/usr/local/node-v${version}-linux-x64":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    recurse => true,
    require => Exec['untar-nodejs'],
  }

  file { '/usr/local/nodejs':
    ensure  => 'link',
    owner   => 'root',
    group   => 'root',
    target  => "/usr/local/node-v${version}-linux-x64",
    require => Exec['untar-nodejs'],
  }

  file { '/etc/profile.d/nodejs.sh':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/nodejs/profile.txt',
  }

  package { 'nodejs': ensure => absent }

}
