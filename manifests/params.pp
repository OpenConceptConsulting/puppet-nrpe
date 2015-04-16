# == Class: nrpe::params
#
# Sets the default parameters for the NRPE class.
class nrpe::params {

  $package_ensure = present
  $service_ensure = running
  $service_enable = true

  $debug                           = false
  $allowed_hosts                   = ['127.0.0.1']
  $server_port                     = '5666'
  $server_address                  = undef
  $dont_blame_nrpe                 = false
  $command_prefix                  = undef
  $command_timeout                 = 60
  $allow_bash_command_substitution = false
  $connection_timeout              = 300
  $allow_weak_random_seed          = false

  $default_config       = '/etc/nagios/nrpe.cfg'
  $default_package_name = 'nagios-nrpe-server'
  $default_service_name = 'nagios-nrpe-server'

  case $::osfamily {
    Debian: {
      $log_facility  = 'daemon'
      $config        = $default_config
      $package_name  = $default_package_name
      $service_name  = $default_service_name
      $user          = 'nagios'
      $group         = 'nagios'
      $pid_file      = '/var/run/nagios/nrpe.pid'
      $include_files = [
      ]
      $include_dirs  = [
        '/etc/nagios/nrpe.d/'
      ]

      case $::operatingsystem {
        Debian: {
          if $::operatingsystemmajrelease < 7 {
            $supports_bash_substitution = false
          } else {
            $supports_bash_substitution = true
          }
        }
        default: {
          $supports_bash_substitution = true
        }
      }

      $commands     = {
        'check_users'        => '/usr/lib/nagios/plugins/check_users -w 5 -c 10',
        'check_load'         => '/usr/lib/nagios/plugins/check_load -w 15,10,5 -c 30,25,20',
        'check_hda1'         => '/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -p /dev/hda1',
        'check_zombie_procs' => '/usr/lib/nagios/plugins/check_procs -w 5 -c 10 -s Z',
        'check_total_procs'  => '/usr/lib/nagios/plugins/check_procs -w 150 -c 200',
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}

