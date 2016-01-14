define users::managed_user (
  $user     = ${title},
  $home_dir = "/usr/home/${title}",
  $group    = 'root',
  $ssh_dir  = '/ssh/${title}',
)
