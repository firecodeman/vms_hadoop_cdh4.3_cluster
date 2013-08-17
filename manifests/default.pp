#node 'vm-cluster-n5' {
#  include cdh::ssh::install
#}

node 'common' {
  #host
  include env
  env::host{"host m":
    key=>"master",
    value=>"10.211.55.100"
  }
  env::host{"host s1":
    key=>"slave1",
    value=>"10.211.55.101"
  }
  env::host{"host s2":
    key=>"slave2",
    value=>"10.211.55.102"
  }
  env::host{"host s3":
    key=>"slave3",
    value=>"10.211.55.103"
  }
  env::host{"host s4":
    key=>"slave4",
    value=>"10.211.55.104"
  }
  env::host{"host cl":
    key=>"client",
    value=>"10.211.55.105"
  }
  #jdk
  include jdk::install
  #hadoop
  include wget
  include cdh::user::init
  include linux::mount_disk
  #include cdh::hadoop::prepare_datanode_dir
  include cdh::hadoop::install
  include cdh::hadoop::config
  
  #hbase
  $hbase_tar_url="http://archive.cloudera.com/cdh4/cdh/4/hbase-0.94.6-cdh4.3.0.tar.gz"
  $hbase_local_file="/vagrant/download/hbase-0.94.6-cdh4.3.0.tar.gz"
  $hbase_release="hbase-0.94.6-cdh4.3.0"
  $hbase_dir="/usr/local/hbase"
  include cdh::hbase::install
}

node 'vm-cluster-master' inherits 'common'{
  include cdh::hadoop::prepare_datanode_dir

  cdh::user::dist_rsa {"dist_rsa n2":
  user => "hadoop",
  host => "slave1",
  }

  cdh::user::dist_rsa {"dist_rsa n3":
  user => "hadoop",
  host => "slave2",
  }
  cdh::user::dist_rsa {"dist_rsa n4":
  user => "hadoop",
  host => "slave3",
  }
  cdh::user::dist_rsa {"dist_rsa n5":
  user => "hadoop",
  host => "slave4",
  }
  cdh::user::dist_rsa {"dist_rsa nc":
  user => "hadoop",
  host => "client",
  }

  $zookeeper_tar_url="http://archive.cloudera.com/cdh4/cdh/4/zookeeper-3.4.5-cdh4.3.0.tar.gz"
  $zookeeper_local_file="/vagrant/download/zookeeper-3.4.5-cdh4.3.0.tar.gz"
  $zookeeper_release="zookeeper-3.4.5-cdh4.3.0"
  $zookeeper_dir="/usr/local/zookeeper"
  $zk_data_dir="/usr/local/zookeeper/data"
  $zk_datalog_dir="/usr/local/zookeeper/datalog"
  include cdh::zookeeper::install
  include cdh::zookeeper::config
  include cdh::zookeeper::prepare_data_dir

  cdh::zookeeper::set_myid{"set myid_1":
    id => "1"
  }
  
  #path
  env::export {"export path":
    key => "PATH",
    value => "\$PATH:$JAVA_HOME/bin:\$HADOOP_HOME/bin:\$HBASE_HOME/bin:\$ZK_HOME/bin",
  }


}

node 'vm-cluster-n1','vm-cluster-n2','vm-cluster-cl' inherits 'common' {
  include cdh::hadoop::prepare_datanode_dir
  env::export {"export path":
    key => "PATH",
    value => '\$PATH:\$JAVA_HOME/bin:\$HADOOP_HOME/bin:\$HBASE_HOME/bin',
  }

}

node 'vm-cluster-n3' inherits 'common' {
  include cdh::hadoop::prepare_datanode_dir

  $zookeeper_tar_url="http://archive.cloudera.com/cdh4/cdh/4/zookeeper-3.4.5-cdh4.3.0.tar.gz"
  $zookeeper_local_file="/vagrant/download/zookeeper-3.4.5-cdh4.3.0.tar.gz"
  $zookeeper_release="zookeeper-3.4.5-cdh4.3.0"
  $zookeeper_dir="/usr/local/zookeeper"
  $zk_data_dir="/usr/local/zookeeper/data"
  $zk_datalog_dir="/usr/local/zookeeper/datalog"
  include cdh::zookeeper::install
  include cdh::zookeeper::config
  include cdh::zookeeper::prepare_data_dir

  cdh::zookeeper::set_myid{"set myid_2":
    id => "2"
  }
  
  #path
  env::export {"export path":
    key => "PATH",
    value => "\$PATH:$JAVA_HOME/bin:\$HADOOP_HOME/bin:\$HBASE_HOME/bin:\$ZK_HOME/bin",
  }

}

node 'vm-cluster-n4' inherits 'common' {
  include cdh::hadoop::prepare_datanode_dir

  $zookeeper_tar_url="http://archive.cloudera.com/cdh4/cdh/4/zookeeper-3.4.5-cdh4.3.0.tar.gz"
  $zookeeper_local_file="/vagrant/download/zookeeper-3.4.5-cdh4.3.0.tar.gz"
  $zookeeper_release="zookeeper-3.4.5-cdh4.3.0"
  $zookeeper_dir="/usr/local/zookeeper"
  $zk_data_dir="/usr/local/zookeeper/data"
  $zk_datalog_dir="/usr/local/zookeeper/datalog"
  include cdh::zookeeper::install
  include cdh::zookeeper::config
  include cdh::zookeeper::prepare_data_dir

  cdh::zookeeper::set_myid{"set myid_3":
    id => "3"
  }
  
  #path
  env::export {"export path":
    key => "PATH",
    value => "\$PATH:$JAVA_HOME/bin:\$HADOOP_HOME/bin:\$HBASE_HOME/bin:\$ZK_HOME/bin",
  }

}


