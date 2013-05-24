class people::lsylvester {
  git::config::global{ 'user.name':
    value => 'lsylvester'
  }
  git::config::global{ 'user.email':
    value => 'lachlan.sylvester@hypothetical.com.au'
  }
  git::config::global{ 'color.ui':
    value => 'true'
  }
  git::config::global{ 'push.default':
    value => 'simple'
  }

  file { '/Users/lachlansylvester/Library/Application Support/TextMate/Managed/Bundles':
    ensure =>  directory,
  }

  repository { '/Users/lachlansylvester/Library/Application Support/TextMate/Managed/Bundles/Cucumber.tmbundle':
    source  => 'cucumber-tmbundle',
    require => File['/Users/lachlansylvester/Library/Application Support/TextMate/Managed/Bundles']
  }
  
  repository { '/Users/lachlansylvester/Library/Application Support/TextMate/Managed/Bundles/puppet-textmate-bundle':
    source  => 'masterzen/puppet-textmate-bundle',
    require => File['/Users/lachlansylvester/Library/Application Support/TextMate/Managed/Bundles']
  }
  
  file { '/Users/lachlansylvester/Library/Application Support/TextMate/Managed/Bundles/Puppet.tmbundle':
    ensure =>  link,
    target => '/Users/lachlansylvester/Library/Application Support/TextMate/Managed/Bundles/puppet-textmate-bundle/Puppet.tmbundle'
  }
  
  dockutil::item { 'Add Skype':
    item     => "/Applications/Skype.app",
    label    => "Skype",
    action   => "add",
    position => 5,
  }
}
