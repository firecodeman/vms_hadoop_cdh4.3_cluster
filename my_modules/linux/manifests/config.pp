class linux::config {
  file {"/etc/hosts":
      ensure  => file,
      content => template('/tmp/vagrant-puppet/modules-0/cdh/templates/etc/hosts.erb'),
  }
 
}
