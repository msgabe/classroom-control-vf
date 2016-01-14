class nginx (
  #$root = undef,
)
{ 
  case $::osfamily {
    'redhat','debian' : {
      $package = 'nginx'
      $owner = 'root'
      $group = 'root'
      $default_docroot = '/var/www'
      $confdir = '/etc/nginx'
    
    }
    'windows' : {
      $package = 'nginx-service'
      $owner = 'Administrator'
      $group = 'Administrators'
      $docroot = 'C:/ProgramData/nginx/html'
      $confdir = 'C:/ProgramData/nginx'
    }
    default : {
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }
  }
  
  $docroot = $root ? {
    undef   =>  '/var/www',
    default =>  $root,
  }

  package{ $package:
    ensure => present,
  }
  file { $docroot:
    ensure => directory,
  }
  file {"${docroot}/index.html":
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }
  file { "${confdir}/nginx.conf":    
    ensure => file,
    content => template('nginx/nginx.conf.erb'),
    notify => Service[$package],
    require => Package[$package],
  }
  file { "${confdir}/conf.d/default.conf":
    ensure => file,
    content => template('nginx/default.conf.erb'),
    notify => Service[$package],
    require => Package[$package],
  }
  service {'nginx':
    ensure => running,
    enable => true,
    
    #subscribe => [File['/var/www/index.html'],File['/etc/nginx/conf.d/default.conf']]
  }
}
