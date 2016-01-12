class nginx { 

  package{nginx:
    ensure => present,
  }
  file{'/var/www':
    ensure => directory,
  }
  file {'/var/www/index.html':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0775',
    source => 'puppet:///modules/nginx/index.html',
    require => Package['nginx'],
  }
  service {'nginx':
    ensure => running,
    enable => true,
    subscribe => File['/var/www/index.html'],
  }
}
