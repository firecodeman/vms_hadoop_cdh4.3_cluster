class cdh::user::init {

  user { "hadoop":
    ensure     => "present",
    home => "/home/hadoop",
    managehome => true,
    #by  openssl passwd -1
    #manages_passwords => true,
    password => '$1$Gbm/jt5e$7tHVUR.79os9BGejInQ5h/',
    shell => "/bin/bash",
  }
  exec {"hadoop_passwd":
    path => ["/bin","/usr/sbin"],
    command => "echo hadoop:hadoop|chpasswd",
    require => User["hadoop"]
  }


  user { "hdfs":
    ensure     => "present",
    home => "/home/hdfs",
    managehome => true,
#    manages_passwords => true,
    password => '$1$yy7GcS/I$05QEguza8eRA/V/UK2w6H1',
    shell => "/bin/bash",
  }

  exec {"hdfs_passwd":
    path => ["/bin","/usr/sbin"],
    command => "echo hdfs:hdfs|chpasswd",
    require => User["hdfs"]
  }


  user { "hbase":
    ensure     => "present",
    home => "/home/hbase",
    managehome => true,
    #by grub-md5-crypt
    #manages_passwords => true,
    password => '$1$zxNAUhqS$fZ8zI2HVhc5zR1ianmSlA0',
    shell => "/bin/bash",
  }
  exec {"hbase_passwd":
    path => ["/bin","/usr/sbin"],
    command => "echo hbase:hbase|chpasswd",
    require => User["hbase"]
  }

}
