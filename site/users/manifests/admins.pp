class users::admins {
  users::managed_user { 'joe': }
  users::managed_user { 'chen': }
  users::managed_user { 'alice':
    group => 'users',
    require =>  Group['users'],
  }
  
  group { 'users':
    ensure => present,
  }
}
