# == Class: nrpe::install
#
# Installs the NRPE package.
class nrpe::install inherits nrpe {

  package { $nrpe::package_name:
    ensure => $nrpe::package_ensure,
  }

}
