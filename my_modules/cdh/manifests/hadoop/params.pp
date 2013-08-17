class cdh::hadoop::params {
  $hadoop_tar_url='http://archive.cloudera.com/cdh4/cdh/4/hadoop-2.0.0-cdh4.3.0.tar.gz'
  $download_file='/vagrant/download/hadoop-2.0.0-cdh4.3.0.tar.gz'
  $hadoop_dir='/usr/local/hadoop'
  $release_dir='hadoop-2.0.0-cdh4.3.0'
  $current_dir='current'

  $dfs_namenode_name_dir=[ "/data" , "/data/1" , "/data/1/dfs" , "/data/1/dfs/nn" ]
  $dfs_datanode_data_dir=[ "/data" , "/data/1" , "/data/1/dfs" , "/data/1/dfs/dn" ]
}

