class { 'r10k':
  provider   => 'puppet_gem',
  configfile => '/etc/puppetlabs/r10k/r10k.yaml',
  sources   => {
    'puppet'  => {
      'remote'     => 'https://github.com/ericbisme/puppet-control.git',
      'basedir'    => "/etc/puppetlabs/code/environments",
      'prefix'     => false,
    },
  },
}

class { 'r10k::mcollective':
  ensure => false,
}

# Instead of running via mco, run r10k directly
class {'r10k::webhook::config':
  use_mcollective => false,
  public_key_path  => '/etc/mcollective/server_public.pem',  # Mandatory for FOSS
  private_key_path => '/etc/mcollective/server_private.pem', # Mandatory for FOSS
}

# The hook needs to run as root when not running using mcollective
# It will issue r10k deploy environment <branch_from_gitlab_payload> -p
# When git pushes happen.
class {'r10k::webhook':
  use_mcollective => false,
  user            => 'root',
  group           => '0',
  require         => Class['r10k::webhook::config'],
}
