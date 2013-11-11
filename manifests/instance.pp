define nodejs::instance (
  $user = 'deploy',
  $group = 'deploy',
  $path = '/var/nodes'
) {
  file { $path:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }

  file { "${path}/${name}":
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '0775',
    require => File[$path],
  }

  file { "/etc/init.d/nodejs-${name}":
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('nodejs/nodejs.erb'),
  }

}
