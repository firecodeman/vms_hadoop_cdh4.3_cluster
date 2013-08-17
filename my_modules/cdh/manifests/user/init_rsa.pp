class cdh::user::init_rsa {
  exec {"init_null_rsa":
    path    => ["/bin/","/usr/bin/"],
    command =>"ssh-keygen -t rsa -P '' -f /home/hadoop/.ssh/id_rsa",
    creates =>"/home/hadoop/.ssh/id_rsa",
    user => "hadoop",
    require => User["hadoop"]
  }
  
  package {"sshpass":
    ensure => "installed",
    require => Exec["init_null_rsa"]
  }
}
