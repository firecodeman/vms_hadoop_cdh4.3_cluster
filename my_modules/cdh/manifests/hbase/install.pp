class cdh::hbase::install {
  include wget

  wget::fetch { "hbase":
    source      => "${hbase_tar_url}",
    destination => "${hbase_local_file}",
    timeout     => 0,
    verbose     => false,
  }
  
  exec {
    "extract hbase tar":
    command => "/bin/mkdir -p ${hbase_dir}/${hbase_release} && cd ${hbase_dir} && tar -xzvf ${hbase_local_file}",
    unless  => "/usr/bin/test -d ${hbase_dir}/${hbase_release}",
#    require => User["hadoop"],
    require => wget::fetch["hbase"],
  }

  file { "${hbase_dir}":
    ensure => "directory",
    owner  => "hadoop",
    group  => "hadoop",
    mode   => 770,
    require => Exec["extract hbase tar"],
  }
  
  exec { "chown hbase dir":
    command => "/bin/chown -R hadoop:hadoop ${hbase_dir}/${hbase_release}",
    require => File["${hbase_dir}"],
  }

 
  file {"${hbase_dir}/current": 
    ensure => 'link',
    owner  => "hadoop",
    group  => "hadoop",
    mode   => 770,
    target => "${hbase_dir}/${hbase_release}",
    require => Exec["chown hbase dir"],
  }
  
  include env
  env::export {"export hbase home":
    key => "HBASE_HOME",
    value => "${hbase_dir}/current",
    require => File["${hbase_dir}/current"]
  }

}
 
