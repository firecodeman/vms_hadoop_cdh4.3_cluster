class cdh::hadoop::prepare_datanode_dir inherits cdh::hadoop::params {
  file { $dfs_datanode_data_dir:
    ensure => "directory",
    owner  => "hdfs",
    group  => "hdfs",
    mode   => 770,
    force  => true,
    require => Exec["mount_disk"]
  } 
}
