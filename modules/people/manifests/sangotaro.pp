class people::sangotaro {
  include virtualbox
  include vagrant
  include chrome
  include firefox

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

  # other
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
}
