define nodejs::service (
  $ensure,
  $enable
) {
  service { "nodejs-${name}":
    ensure => $ensure,
    enable => $enable,
  }

}
