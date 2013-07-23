require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $luser,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::luser}"
  ]
}

File {
  group => 'staff',
  owner => $luser
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => Class['git']
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # default ruby versions
  include ruby::1_8_7
  include ruby::1_9_2
  include ruby::1_9_3
  include ruby::1_9_3_p448
  include ruby::2_0_0_p0
  include ruby::2_0_0_p195
  include ruby::1_8_7_p358
  include ruby::1_8_7_p357
  include postgresql
  include wkhtmltopdf
  include imagemagick
  include mysql
  include redis
  include memcached
  include skype
  include dockutil
  include chrome
  include virtualbox
  include phantomjs
  include vagrant
  include rabbitmq
  phantomjs::version { '1.9.0': }
  
  include nodejs::v0_10
  nodejs::module { 'coffee-script':
    node_version => 'v0.10',
    ensure       => '1.6.2'
  }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
