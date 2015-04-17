# Class: nodejs
#
# This class installs the nodejs package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the nodejs package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'nodejs':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'nodejs':
#      ensure => 'absent'
#    }
#
class nodejs (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'nodejs',
  }

  package { $required: ensure => $ensure }

}
