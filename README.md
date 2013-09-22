rbenv-bundler-ruby-version
==========================

Plugin for [rbenv](https://github.com/sstephenson/rbenv) to use a ruby version from
[bundler](http://bundler.io/)'s Gemfile. If a custom Ruby version 
is not already defined per-shell or locally per-directory (like in `.ruby-version`), this looks
for a Ruby version in the current tree's Gemfile and uses that version.

Installation
------------
1. Check the plugin out into your rbenv plugins directory:

  ```sh
  git clone https://github.com/aripollak/rbenv-bundler-ruby-version.git \
      ~/.rbenv/plugins/rbenv-bundler-ruby-version
  ```
  
1. If you don't already have a symlink in `~/.rbenv/versions` from your latest Ruby patchlevel to the base version,
now would be a good time to do that. You can install [rbenv-aliases](https://github.com/tpope/rbenv-aliases)
to make this easier. Once you have rbenv-aliases installed: run:

  ```sh
  rbenv alias --auto
  ```

1. That's it! Now `ruby`, `gem`, and your other rbenv shims should automatically find the correct Ruby version.

Caveats
-------
The logic currently used to find the version is pretty dumb, and it only supports simple lines
like `ruby '2.0.0'`. Other interpreters are not supported at this point.
