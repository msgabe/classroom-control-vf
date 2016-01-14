class nginx (
  $doc_root = undef,
)  {
    File {
      owner =>  $owner,
      group =>  $group,
      mode  =>  '0664',
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

