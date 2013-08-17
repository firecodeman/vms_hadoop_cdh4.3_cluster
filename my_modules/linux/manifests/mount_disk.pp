class linux::mount_disk{
  exec {"mount_disk":
    command =>"/vagrant/scripts/format_mount_data_dir.sh",
  } 
}
