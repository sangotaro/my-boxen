class people::sangotaro {
  include virtualbox
  include vagrant
  include chrome
  include firefox

  homebrew::tap { 'sanemat/font': }
  package { 'ricty': }
  package {
    [
      'tree',
      'rename'
    ]:
  }

  # dotfile setting
  $home = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source => 'sangotaro/dotfiles',
  }
  exec { "sh ${dotfiles}/install.sh":
    cwd => "${home}/dotfiles",
    require => Repository[$dotfiles],
    creates => "${home}/.vimrc"
  }

  package {
    'XtraFinder':
      source   => "http://www.trankynam.com/xtrafinder/downloads/XtraFinder.dmg",
      provider => pkgdmg;
  }
}
