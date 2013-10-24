class people::sangotaro {
  include virtualbox
  include vagrant
  include firefox

  package {
    [
      'tree',
      'rename'
    ]:
  }
  $home = "/Users/$(::boxen_user)"
}
