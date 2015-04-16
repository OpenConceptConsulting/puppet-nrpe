# == Class: nrpe
#
# This class installs and configures the nrpe server.
class nrpe (
  $package_name                    = $nrpe::params::package_name,
  $package_ensure                  = $nrpe::params::package_ensure,
  $service_name                    = $nrpe::params::service_name,
  $service_ensure                  = $nrpe::params::service_ensure,
  $service_enable                  = $nrpe::params::service_enable,
  $config_file                     = $nrpe::params::config,
  $log_facility                    = $nrpe::params::log_facility,
  $debug                           = $nrpe::params::debug,
  $server_port                     = $nrpe::params::server_port,
  $server_address                  = $nrpe::params::server_address,
  $user                            = $nrpe::params::user,
  $group                           = $nrpe::params::group,
  $pid_file                        = $nrpe::params::pid_file,
  $dont_blame_nrpe                 = $nrpe::params::dont_blame_nrpe,
  $allowed_hosts                   = $nrpe::params::allowed_hosts,
  $commands                        = $nrpe::params::commands,
  $command_prefix                  = $nrpe::params::command_prefix,
  $command_timeout                 = $nrpe::params::command_timeout,
  $supports_bash_substitution      = $nrpe::params::supports_bash_substitution,
  $allow_bash_command_substitution = $nrpe::params::allow_bash_command_substitution,
  $connection_timeout              = $nrpe::params::connection_timeout,
  $allow_weak_random_seed          = $nrpe::params::allow_weak_random_seed,
  $include_files                   = $nrpe::params::include_files,
  $include_dirs                    = $nrpe::params::include_dirs,
) inherits nrpe::params {

  validate_absolute_path($config_file)
  validate_bool($debug)
  validate_absolute_path($pid_file)
  validate_bool($dont_blame_nrpe)
  validate_array($allowed_hosts)
  validate_hash($commands)
  validate_bool($allow_bash_command_substitution)
  validate_bool($allow_weak_random_seed)
  validate_array($include_files)
  validate_array($include_dirs)

  anchor { 'nrpe::begin': } ->
  class { 'nrpe::install': } ->
  class { 'nrpe::config': } ~>
  class { 'nrpe::service': } ->
  anchor { 'nrpe::end': }

}

