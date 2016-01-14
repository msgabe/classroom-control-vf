define users::managed_user(
  $group  = 'root',
)
{
  
  user { $title:
    ensure  =>  present,
    group   =>  $group,
  }
  
  file {"/home/${title}":
    ensure  =>  directory,
    owner   =>  $title,
    mode    => '0755',
  }
  file {"/home/${title}/ssh":
    ensure  =>  directory,
    owner   =>  $title,
    mode    => '0755',
  }
  
}
