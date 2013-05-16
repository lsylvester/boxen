# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "1.2.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",  "1.0.0"
github "gcc",      "1.0.0"
github "git",      "1.0.0"
github "homebrew", "1.1.2"
github "hub",      "1.0.0"
github "inifile",  "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "nginx",    "1.1.0"
github "nodejs",   "1.0.0"
github "nvm",      "1.0.0"
github "ruby",     "4.1.3", :repo => "lsylvester/puppet-ruby"
github "stdlib",   "4.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",     "1.0.0"
github "postgresql", "1.0.0"
github "sysctl", '1.0.0'
github "wkhtmltopdf", '1.0.0'
github "imagemagick", "1.0.1", :repo => "shazino/puppet-imagemagick"
github "xquartz", '1.0.0'
github "mysql", '1.0.0'
github "redis", '1.0.0'

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
