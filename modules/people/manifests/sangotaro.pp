class people::sangotaro {
  include virtualbox
  include vagrant
  include firefox
  $home = "/Users/$(::boxen_user)"
}
