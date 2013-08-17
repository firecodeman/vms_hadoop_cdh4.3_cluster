################################################################################
# Class:jdk install 
#
# This class will install wget - a tool used to download content from the web.
#
################################################################################
class jdk::install inherits jdk::params {
  include wget
  
  wget::fetch { "oracle-jdk6":
    source      => "${oracle_jdk6_bin_url}",
    destination => "${download_file}",
    timeout     => 0,
    verbose     => false,
  }  
  
  package { "unzip":
    ensure => "installed"
  }
 
  exec {"unzip_jdk":
    path    => ["/bin/","/usr/bin/"],
    command =>"mkdir -p ${jdk_path}/${release_dir} && cd ${jdk_path} && ${download_file}",
    creates => "${jdk_path}/${release_dir}",
#    timeout => 0,
    unless => "test -d ${jdk_path}/${release_dir}",
    require => Package["unzip"],
  }
  
#  exec { "chown_jdk_path":
#    path => "/bin/",
#    command => "chown -R hadoop:hadoop ${jdk_path}",
#    require => Exec["unzip_jdk"],
#  }


  file {"${jdk_path}/${current_dir}": 
    ensure => 'link',
#    owner  => "hadoop",
#    group  => "hadoop",
    mode   => 776,
    target => "${jdk_path}/${release_dir}",
#    require => Exec["chown_jdk_path"],
    require => Exec["unzip_jdk"],
  }
  
  include env
  env::export {"export_java_home":
   key => "JAVA_HOME",
   value => "${jdk_path}/${current_dir}"
  }

}
