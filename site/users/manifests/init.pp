class managed_users {
  users::managed_user { 'jose':
    ensure => present,
    
  }
}
