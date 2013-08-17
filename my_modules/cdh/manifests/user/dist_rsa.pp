#class cdh::user::dist_rsa {

#}
define cdh::user::dist_rsa(
  $user,
  $host,
) {
 
  exec {"dist_rsa $user to $host":
    path => ["/bin/","/usr/bin/"],
    #command =>"echo 'StrictHostKeyChecking no'>>~/.ssh/config && chmod 600 /home/$user/.ssh/id_rsa && sshpass -p'$user' ssh-copy-id $user@$host",
    command =>"su - $user -c \"echo 'StrictHostKeyChecking no'>>~/.ssh/config && chmod 600 /home/$user/.ssh/id_rsa && sshpass -p'$user' ssh-copy-id $user@$host\"",
    #user =>"$user",
  }

}

