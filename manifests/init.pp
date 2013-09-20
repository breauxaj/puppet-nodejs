class nodejs {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nodejs',
  }

  package { $required: ensure => latest }

}
