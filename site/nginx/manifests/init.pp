class nginx { 

  package{nginx:
    ensure => present,
  }
  file{'/var/www':
    ensure => directory,
  }
  file {'/etc/sysconfig/index.html':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/index.html',
    require => Package['nginx'],
  }
  service {'nginx':
    ensure => running,
    subscribe => File['/etc/sysconfig/index.html'],
  }
|
