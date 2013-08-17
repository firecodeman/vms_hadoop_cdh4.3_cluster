class cdh::hadoop::prepare_namenode_dir inherits cdh::hadoop::params {
  file { $dfs_namenode_name_dir:
    ensure => "directory",
    owner  => "hdfs",
    group  => "hdfs",
    mode   => 770,
    #recurse => "${dfs_namenode_name_dir}/../",
  } 
  
}
