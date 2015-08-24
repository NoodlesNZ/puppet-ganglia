class ganglia::modules::apache {
  include ganglia::modules

  file { '/etc/ganglia/conf.d/apache_status.pyconf.disabled':
    ensure  => absent,
    require => Package['ganglia-gmond-python'],
  }

  file { '/etc/ganglia/conf.d/apache_status.pyconf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/ganglia/modules/apache_status.pyconf',
    notify  => Service['gmond'],
    require => Package['ganglia-gmond-python'],
  }
}