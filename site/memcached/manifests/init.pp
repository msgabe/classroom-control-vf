class memcached {

  package { 'memched':
    ensure => present,
  }
  file { '/etc/sysconfig/memcached':
    ensure => present,
    source => 'puppet:///modules/memchached/memcached',
    require => Package['memcached'],
  }
  service {'memcached':
    ensure => running,
    subscribe => File['/etc/memcached.conf'],
  }
    


