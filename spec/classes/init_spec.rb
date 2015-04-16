require 'spec_helper'

describe 'nrpe' do

  {'Ubuntu' => 'Debian', 'Debian' => 'Debian'}.each do |system, family|
    context "when on system #{system}" do
      if system == 'Debian'
        let :facts do
          {
            :osfamily        => family,
            :operatingsystem => system,
            :operatingsystemmajrelease => 7,
          }
        end
      else
        let :facts do
          {
            :osfamily        => family,
            :operatingsystem => system,
          }
        end
      end

      it { should contain_class('nrpe') }
      it { should contain_class('nrpe::install') }
      it { should contain_class('nrpe::config') }
      it { should contain_class('nrpe::service') }

      it {
        should contain_package('nagios-nrpe-server')
        should contain_service('nrpe')
      }
    end
  end

  context "when on system Debian 6" do
    let :facts do
      {
        :osfamily        => 'Debian',
        :operatingsystem => 'Debian',
        :operatingsystemmajrelease => 6,
      }
    end

    it {
      should contain_file('/etc/nagios/nrpe.cfg').without_content(/allow_bash_command_substitution=\d/)
    }
  end

  context 'when on an unknown system' do
    it { expect { should raise_error(Puppet::Error) } }
  end
end
