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
}