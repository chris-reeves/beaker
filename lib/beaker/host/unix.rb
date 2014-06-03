[ 'host', 'command_factory', 'command', 'options' ].each do |lib|
      require "beaker/#{lib}"
end

module Unix
  class Host < Beaker::Host
    [ 'user', 'group', 'exec', 'pkg', 'file' ].each do |lib|
          require "beaker/host/unix/#{lib}"
    end

    include Unix::User
    include Unix::Group
    include Unix::File
    include Unix::Exec
    include Unix::Pkg

    def self.pe_defaults
      h = Beaker::Options::OptionsHash.new
      h.merge({
        'user'          => 'root',
        'group'         => 'pe-puppet',
        'service-wait'  => false,
        'service-prefix'=> '/etc/init.d/',
        'puppetservice' => 'pe-httpd',
        'puppetpath'    => '/etc/puppetlabs/puppet',
        'puppetbin'     => '/opt/puppet/bin/puppet',
        'puppetbindir'  => '/opt/puppet/bin',
        'puppetvardir'  => '/var/opt/lib/pe-puppet',
        'hieradatadir'  => '/var/lib/hiera',
        'hieraconf'     => '/etc/puppetlabs/puppet/hiera.yaml',
        'distmoduledir' => '/etc/puppetlabs/puppet/modules',
        'sitemoduledir' => '/opt/puppet/share/puppet/modules',
        'pathseparator' => ':',
      })
    end

    def self.foss_defaults
      h = Beaker::Options::OptionsHash.new
      h.merge({
        'user'              => 'root',
        'group'             => 'puppet',
        'service-wait'      => false,
        'puppetpath'        => '/etc/puppet',
        'puppetvardir'      => '/var/lib/puppet',
        'puppetbin'         => '/usr/bin/puppet',
        'puppetbindir'      => '/usr/bin',
        'hieralibdir'       => '/opt/puppet-git-repos/hiera/lib',
        'hierapuppetlibdir' => '/opt/puppet-git-repos/hiera-puppet/lib',
        'hierabindir'       => '/opt/puppet-git-repos/hiera/bin',
        'hieradatadir'      => '/etc/puppet/hieradata',
        'hieraconf'         => '/etc/puppet/hiera.yaml',
        'distmoduledir'     => '/etc/puppet/modules',
        'sitemoduledir'     => '/usr/share/puppet/modules',
        'pathseparator'     => ':',
      })
    end
  end
end
