define users::managed_user {
  
  user { $title:
    ensure  =>  present,
    group   =>  'root',
  }
  
  file {'/home/${title}':
    ensure  =>  directory,
    owner   =>  $title,
    mode    => '0755',
  }
  file {'/home/${title}/ssh':
    ensure  =>  directory,
    owner   =>  $title,
    mode    => '0755',
  }
  
}
