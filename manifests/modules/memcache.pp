class ganglia::modules::memcached {
  include ganglia::modules

  file { '/etc/ganglia/conf.d/memcached.pyconf.disabled':
    ensure => absent,
  }

  file { '/etc/ganglia/conf.d/memcached.pyconf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/ganglia/modules/memcached.pyconf',
    notify => Service['gmond'],
  }
}