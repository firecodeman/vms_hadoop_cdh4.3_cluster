class cdh::zookeeper::config {
  file {"${zookeeper_dir}/current/conf/zoo.cfg":
      ensure  => file,
      content => template('/tmp/vagrant-puppet/modules-0/cdh/templates/zookeeper/conf/zoo.cfg.erb'),
  }   
}
