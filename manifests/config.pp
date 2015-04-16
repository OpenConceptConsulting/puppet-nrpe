# == Class: nrpe::config
#
# Manages the NRPE server configuration file
class nrpe::config inherits nrpe {

  $debug_num                           = bool2num($nrpe::debug)
  $dont_blame_nrpe_num                 = bool2num($nrpe::dont_blame_nrpe)
  $allow_weak_random_seed_num          = bool2num($nrpe::allow_weak_random_seed)
  $allow_bash_command_substitution_num = bool2num($nrpe::allow_bash_command_substitution)

  file { $nrpe::config_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nrpe/nrpe.erb')
  }

}

