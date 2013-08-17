class cdh::ssh::install inherits cdh::ssh::params {
  package { "ssh":
    name => $ssh_package_name,
    ensure => installed,
  }
}

