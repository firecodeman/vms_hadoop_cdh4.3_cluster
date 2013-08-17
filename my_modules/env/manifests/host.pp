define env::host(
  $key,
  $value,
) {
 
  exec {"host $key=$value":
    command =>"/vagrant/scripts/export_host.sh $key $value",
  }

}

