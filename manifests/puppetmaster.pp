class { 'r10k':
  sources => {
    'ericbisme'  => {
      'remote'     => 'https://github.com/ericbisme/puppet-control.git',
      'basedir'    => "/etc/puppetlabs/code/environments",
      'provider'   => 'puppet_gem',
      'configfile' => '/etc/puppetlabs/r10k/r10k.yaml',
      'prefix'     => false,
    },
  },
}
