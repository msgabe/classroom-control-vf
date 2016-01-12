class nginx { 

  package{nginx:
    ensure => present,
  }
  file{'/var/www':
    ensure => directory,
  }
  file {'index.html':
    source => 
  }
  service {'nginx':
    ensure => running,
    
  }
|
