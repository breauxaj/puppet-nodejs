class nodejs {
  $required = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nodejs',
  }

  package { $required: ensure => latest }

}

define nodejs::service ( $ensure,
                         $enable ) {
  service { "nodejs-$name":
    ensure => $ensure,
    enable => $enable,
  }

}

define nodejs::npm {
  package { "nodejs-$name": ensure => latest}

}

define nodejs::instance ( $user = 'deploy',
                          $group = 'deploy',
                          $path = '/var/nodes' ) {
  file { "$path":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }

  file { "$path/$name":
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '0775',
  }

  file { "/etc/init.d/nodejs-$name":
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('nodejs/nodejs.erb'),
  }

}
