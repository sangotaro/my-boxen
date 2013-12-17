class people::sangotaro {
  include virtualbox
  include vagrant
  include chrome
  include firefox

  include people::sangotaro::ruby

  package {
    'XtraFinder':
      source   => "http://www.trankynam.com/xtrafinder/downloads/XtraFinder.dmg",
      provider => pkgdmg;
    'GoogleJapaneseInput':
      source => "http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg",
      provider => pkgdmg;
    'Mou':
      source   => "http://mouapp.com/download/Mou.zip",
      provider => compressed_app;
  }

  # Homebrew
  homebrew::tap { 'sanemat/font': }
  package { 'ricty': }
  package {
    [
      'tree',
      'rename',
      'tig'
    ]:
  }

  $home = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"

  class { 'nodejs::global': version => 'v0.10.21' }

  # dotfiles
  repository { $dotfiles:
    source => 'sangotaro/dotfiles',
  }
  exec { "sh ${dotfiles}/install.sh":
    cwd => "${home}/dotfiles",
    require => Repository[$dotfiles],
    creates => "${home}/.vimrc"
  }
}
