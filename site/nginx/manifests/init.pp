class nginx { 

  package{'nginx':
    ensure => present,
  }
  file {'/var/www/index.html':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/index.html',
    require => Package['nginx'],
  }
  file { '/var/www':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755',
  }
  file { '/etc/nginx/nginx.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Package['nginx'],
    source => 'puppet:///modules/nginx/nginx.conf',
  }
  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
  }
  service {'nginx':
    ensure => running,
    enable => true,
    subscribe => [File['/var/www/index.html'],File['/etc/nginx/conf.d/default.cong']]
  }
}
