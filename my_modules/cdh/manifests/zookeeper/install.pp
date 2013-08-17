class cdh::zookeeper::install {
  include wget

  wget::fetch { "zookeeper":
    source      => "${zookeeper_tar_url}",
    destination => "${zookeeper_local_file}",
    timeout     => 0,
    verbose     => false,
  }
  
  exec {
    "extract zookeeper tar":
    command => "/bin/mkdir -p ${zookeeper_dir}/${zookeeper_release} && cd ${zookeeper_dir} && tar -xzvf ${zookeeper_local_file}",
    unless  => "/usr/bin/test -d ${zookeeper_dir}/${zookeeper_release}",
#    require => User["hadoop"],
    require => wget::fetch["zookeeper"],
  }

  file { "${zookeeper_dir}":
    ensure => "directory",
    owner  => "hadoop",
    group  => "hadoop",
    mode   => 770,
    require => Exec["extract zookeeper tar"],
  }
  
  exec { "chown zookeeper dir":
    command => "/bin/chown -R hadoop:hadoop ${zookeeper_dir}/${zookeeper_release}",
    require => File["${zookeeper_dir}"],
  }

 
  file {"${zookeeper_dir}/current": 
    ensure => 'link',
    owner  => "hadoop",
    group  => "hadoop",
    mode   => 770,
    target => "${zookeeper_dir}/${zookeeper_release}",
    require => Exec["chown zookeeper dir"],
  }
  
  include env
  env::export {"export zookeeper home":
    key => "ZK_HOME",
    value => "${zookeeper_dir}/current",
    require => File["${zookeeper_dir}/current"]
  }

}
 
