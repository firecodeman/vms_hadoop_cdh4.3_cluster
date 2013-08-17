class env {
}

define env::export (
  $key,
  $value,
) {
 
  exec {"export $key=$value":
    command =>"/vagrant/scripts/export_env.sh $key $value",
  }

}

