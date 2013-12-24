class people::sangotaro::nodejs {

  $version = 'v0.10.13'

  class { 'nodejs::global': version => "${version}" }

  nodejs::module { "bower":
    node_version => $version,
  }
}
