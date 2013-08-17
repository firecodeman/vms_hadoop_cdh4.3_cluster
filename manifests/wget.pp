define download ($uri, $dst, $timeout = 300) {
  exec {
    "download $uri":
    command => "wget -q '$uri' -O $dst",
    creates => $dst,
    timeout => $timeout,
  }
}
