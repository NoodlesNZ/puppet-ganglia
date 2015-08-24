class ganglia::modules::tcpconn {
  include ganglia::modules

  file { '/etc/ganglia/conf.d/tcpconn.pyconf.disabled':
    ensure => absent,
  }

  file { '/etc/ganglia/conf.d/tcpconn.pyconf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/ganglia/modules/tcpconn.pyconf',
    notify => Service['gmond'],
  }
}