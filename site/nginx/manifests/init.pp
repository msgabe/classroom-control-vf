class nginx { 

  package{'nginx':
    ensure => present,
  }
  file { '/var/www':
    ensure => directory,
  }
  file {'/var/www/index.html':
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
    require => Package['nginx'],
  }
  file { '/etc/nginx/nginx.conf':    
    ensure => file,
    require => Package['nginx'],
    source => 'puppet:///modules/nginx/nginx.conf',
    notify => Service['nginx'],
  }
  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  service {'nginx':
    ensure => running,
    enable => true,
    
    #subscribe => [File['/var/www/index.html'],File['/etc/nginx/conf.d/default.conf']]
  }
}
