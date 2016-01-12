class memcached {

  package { 'memcached':
    ensure => present,
  }
  file { '/etc/memcached.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/memcached/memcached.conf',
    require => Package['memcached'],
  }
  service {'memcached':
    ensure => running,
    enable => true,
    subscribe => File['/etc/memcached.conf'],
  }
}
    


