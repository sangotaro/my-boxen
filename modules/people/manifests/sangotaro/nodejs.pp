class people::sangotaro::nodejs {

  $version = 'v0.10.26'

  class { 'nodejs::global': version => "${version}" }

  nodejs::module { "grunt-cli":
    node_version => $version,
  }

  nodejs::module { "bower":
    node_version => $version,
  }

  nodejs::module { "gulp":
    node_version => $version,
  }

  nodejs::module { "component":
    node_version => $version,
  }

  nodejs::module { "browserify":
    node_version => $version,
  }

  nodejs::module { "webpack":
    node_version => $version,
  }

  nodejs::module { "typescript":
    node_version => $version,
  }
}
