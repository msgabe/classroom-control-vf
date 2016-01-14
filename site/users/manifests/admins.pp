class users::admins {
  users::managed_user { 'joe': }
  users::managed_user { 'chen': }
  users::managed_user { 'alice':
    group => 'users',
  }
  
  group { 'staff':
    ensure => present,
  }
}
