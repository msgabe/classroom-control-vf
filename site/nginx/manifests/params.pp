class params {

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
        $default_docroot = 'C:/ProgramData/nginx/html'
        $confdir = 'C:/ProgramData/nginx'
      }
      default : {
        fail("Module ${module_name} is not supported on ${::osfamily}")
      }
    }
    
    $docroot = $root ? {
      undef   =>  '/var/www',
      default =>  $default_docroot,
    }
    
    
  }
