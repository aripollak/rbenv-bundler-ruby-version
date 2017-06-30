rbenv-bundler-ruby-version
==========================

Plugin for [rbenv](https://github.com/rbenv/rbenv) to use a ruby version from [bundler](http://bundler.io/)'s Gemfile. If a custom Ruby version is not already locally per-directory (like in `.ruby-version`), this looks for a Ruby version in the current tree's Gemfile and uses that version.

Requirements: rbenv 1.0.0 or higher

[![Build Status](https://travis-ci.org/aripollak/rbenv-bundler-ruby-version.png?branch=master)](https://travis-ci.org/aripollak/rbenv-bundler-ruby-version)

Installation
------------
* Check the plugin out into your rbenv plugins directory:

  ```sh
  git clone https://github.com/aripollak/rbenv-bundler-ruby-version.git \
      "$(rbenv root)"/plugins/rbenv-bundler-ruby-version
  ```

* **Not needed starting from Ruby 2.1**: If you don't already have a symlink in `"$(rbenv root)"/versions` from your latest Ruby patchlevel (2.0.0-p247) to the base version (2.0.0), now would be a good time to do that. You can install [rbenv-aliases](https://github.com/tpope/rbenv-aliases) to make this easier. Once you have rbenv-aliases installed: run:

  ```sh
  rbenv alias --auto
  ```

* That's it! Now `ruby`, `gem`, and your other rbenv shims should automatically find the correct Ruby version.

Caveats
-------
The logic currently used to find the version is simplistic; rbenv-bundler-ruby-version supports:
* simple `ruby '2.0.0'`
* lines with engines, like:
  * `ruby '2.0.0', engine: 'jruby', engine_version: '1.7.8'`
  * `ruby "2.0.0", :engine_version => "1.7.8", :engine => 'jruby'`
* comments at the end of line (just strips them)

The parsing is done with regular expressions, i.e. no ruby evaluation is done.  So expressions and conditionals are NOT handled and anything else is not handled.  Prepend `true &&` to the ruby line if you are doing such and want to hide it from this plugin.
