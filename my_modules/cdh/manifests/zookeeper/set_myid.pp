define cdh::zookeeper::set_myid
(
 $id
)
{
  exec { "set myid_$id":
    path => "/bin",
    command => "echo $id >> $zk_data_dir/myid",
    require => File["$zk_data_dir"]
  } 
}
