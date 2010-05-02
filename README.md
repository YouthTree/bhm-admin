# BHM Admin #

bhm-admin is a compass framework, rails engine and assorted libraries that make it
easy to add a simple, crud-like admin user interface to Rails 3 applications. Makes
it as simple as requiring the gem, overriding a few files and configuring it to add
a nice, css3 admin area for rails 3 apps.

It's very opinionated and expects your app follows a few general guidelines (e.g. uses jammit
w/ css and javascript bundles named admin).

## Installation ##

1. Add "gem 'bhm-admin'" to your Gemfile
2. Run bundle install

## Usage ##

To be added soon.

## Configuration ##

The only option at the moment is `BHM::Admin.site_name`. e.g.:

    BHM::Admin.site_name = "MySite"

## Note on Patches/Pull Requests ##
 
1. Fork the project.
2. Make your feature addition or bug fix.
3. Add tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
5. Send me a pull request. Bonus points for topic branches.

## Copyright ##

Copyright (c) 2010 Youth Tree. See LICENSE for details.
