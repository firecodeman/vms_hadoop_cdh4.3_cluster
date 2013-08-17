class cdh::hadoop::install inherits cdh::hadoop::params {
  include wget

  wget::fetch { "hadoop":
    source      => "${hadoop_tar_url}",
    destination => "${download_file}",
    timeout     => 0,
    verbose     => false,
  }
  
#  group { "hadoop":
#    ensure => "present",
#    require => wget::fetch["hadoop"],
#  }

#  user { "hadoop":
#    ensure     => "present",
#    managehome => true,
#    require => Group["hadoop"]
#    require => wget::fetch["hadoop"],
#  }
  
  exec {
    "extract tar":
    command => "/bin/mkdir -p ${hadoop_dir}/${release_dir} && cd ${hadoop_dir} && tar -xzvf ${download_file}",
    unless  => "/usr/bin/test -d ${hadoop_dir}/${release_dir}",
#    require => User["hadoop"],
    require => wget::fetch["hadoop"],
  }

  file { "${hadoop_dir}":
    ensure => "directory",
    owner  => "hadoop",
    group  => "hadoop",
    mode   => 770,
    require => Exec["extract tar"]
  }
  
  exec { "chown":
    command => "/bin/chown -R hadoop:hadoop ${hadoop_dir}/${release_dir}",
    require => File["${hadoop_dir}"],
  }

 
  file {"${hadoop_dir}/${current_dir}": 
    ensure => 'link',
    owner  => "hadoop",
    group  => "hadoop",
    mode   => 770,
    target => "${hadoop_dir}/${release_dir}",
    require => Exec["chown"],
  }
  
  include env
  env::export {"export_hadoop_home":
    key => "HADOOP_HOME",
    value => "${hadoop_dir}/${current_dir}",
  }

}
 
