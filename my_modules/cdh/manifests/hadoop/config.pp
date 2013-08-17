class cdh::hadoop::config inherits cdh::hadoop::params {
  file {"${hadoop_dir}/${current_dir}/etc/hadoop/core-site.xml":
      ensure  => file,
      content => template('/tmp/vagrant-puppet/modules-0/cdh/templates/hadoop/conf/core-site.xml.erb'),
  }

  file {"${hadoop_dir}/${current_dir}/etc/hadoop/hdfs-site.xml":
      ensure  => file,
      content => template('/tmp/vagrant-puppet/modules-0/cdh/templates/hadoop/conf/hdfs-site.xml.erb'),
      require => File["${hadoop_dir}/${current_dir}/etc/hadoop/core-site.xml"]
  }

  file {"${hadoop_dir}/${current_dir}/etc/hadoop/yarn-site.xml":
      ensure  => file,
      content => template('/tmp/vagrant-puppet/modules-0/cdh/templates/hadoop/conf/yarn-site.xml.erb'),
      require => File["${hadoop_dir}/${current_dir}/etc/hadoop/hdfs-site.xml"]
  }

  file {"${hadoop_dir}/${current_dir}/etc/hadoop/mapred-site.xml":
      ensure  => file,
      content => template('/tmp/vagrant-puppet/modules-0/cdh/templates/hadoop/conf/mapred-site.xml.erb'),
      require => File["${hadoop_dir}/${current_dir}/etc/hadoop/yarn-site.xml"]
  }
 
  file {"${hadoop_dir}/${current_dir}/etc/hadoop/slaves":
      ensure  => file,
      content => template('/tmp/vagrant-puppet/modules-0/cdh/templates/hadoop/conf/slaves.erb'),
      require => File["${hadoop_dir}/${current_dir}/etc/hadoop/mapred-site.xml"]
  }
 
}
