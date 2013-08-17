class cdh::zookeeper::prepare_data_dir {
  file { $zk_data_dir:
    ensure => "directory",
    owner  => "hadoop",
    group  => "hadoop",
    mode   => 770,
    force  => true,
    require => User["hadoop"]
  } 
   file { $zk_datalog_dir:
    ensure => "directory",
    owner  => "hadoop",
    group  => "hadoop",
    mode   => 770,
    force  => true,
    require => User["hadoop"]
  } 
}
