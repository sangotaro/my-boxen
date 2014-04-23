class people::sangotaro {
  include virtualbox
  include vagrant

  include people::sangotaro::nodejs
  include people::sangotaro::ruby

  $home = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"

  # dotfiles
  repository { $dotfiles:
    source => 'sangotaro/dotfiles',
  }
  exec { "sh ${dotfiles}/install.sh":
    cwd => "${home}/dotfiles",
    require => Repository[$dotfiles],
    creates => "${home}/.vimrc"
  }
  exec { "brew bundle":
    cwd => "${home}/dotfiles",
    require => Repository[$dotfiles]
  }
}
