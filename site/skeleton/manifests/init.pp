class skeleton {
  
  file { '/etc/skel':
  ensure => directory,
  }
  file { '/etc/skel/.bashrc':
  ensure => file,
  source =>
  }
  file { '/site/skeleton/files/bashrc':
  ensure => file,

}
