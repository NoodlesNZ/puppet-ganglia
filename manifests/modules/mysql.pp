class ganglia::modules::mysql(
  $host       = 'localhost',
  $username   = 'root',
  $password   = '',
  $get_innodb = true,
  $get_master = false,
  $get_slave  = false,
) {
  include ganglia::modules

  package { 'MySQL-python':
    ensure => installed,
  }

  file { '/etc/ganglia/conf.d/mysql.pyconf.disabled':
    ensure => absent,
    require => Package['ganglia-gmond-python'],
  }

  file { '/etc/ganglia/conf.d/mysql.pyconf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('ganglia/modules/mysql.pyconf.erb'),
    notify  => Service['gmond'],
    require => Package['ganglia-gmond-python'],
  }

  file { '/usr/lib64/ganglia/python_modules/DBUtil.py':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/ganglia/mysql/DBUtil.py',
    notify  => Service['gmond'],
    require => Package['ganglia-gmond-python'],
  }

  file { '/usr/lib64/ganglia/python_modules/mysql.py':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/ganglia/mysql/mysql.py',
    notify  => Service['gmond'],
    require => Package['ganglia-gmond-python'],
  }
}