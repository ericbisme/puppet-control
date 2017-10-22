class { 'r10k':
  provider   => 'puppet_gem',
  configfile => '/etc/puppetlabs/r10k/r10k.yaml',
  sources   => {
    'ericbisme'  => {
      'remote'     => 'https://github.com/ericbisme/puppet-control.git',
      'basedir'    => "/etc/puppetlabs/code/environments",
      'prefix'     => false,
    },
  },
}
