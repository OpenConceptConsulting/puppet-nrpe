# == Class: nrpe::service
#
# Manages the NRPE service.
class nrpe::service inherits nrpe {

  service { 'nrpe':
    ensure => $nrpe::service_ensure,
    enable => $nrpe::service_enable,
    name   => $nrpe::service_name,
  }

}
