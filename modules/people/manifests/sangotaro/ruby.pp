class people::sangotaro::ruby {

  $rubies = ['2.0.0-p247']
  $global_version = '2.0.0-p247'

  class { 'ruby::global': version => "${global_version}" }

#  define install_gems ($version = $title) {
#    ruby::gem { "chef for ${version}":
#      gem  => 'chef',
#      ruby => $version,
#    }
#    ruby::gem { "knife-solo for ${version}":
#      gem  => 'knife-solo',
#      ruby => $version,
#    }
#    ruby::gem { "berkshelf for ${version}":
#      gem  => 'berkshelf',
#      ruby => $version,
#    }
#  }
#  install_gems { $rubies: }
}
