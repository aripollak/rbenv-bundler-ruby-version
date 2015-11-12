#!/usr/bin/env bats

load test_helper

@test 'Allow overriding version with rbenv local' {
  cd_into_project_with_gemfile "'" 1.2.3
  create_version 4.5.6
  rbenv local 4.5.6
  run rbenv bundler-ruby-version
  assert_success ''
}

@test 'Allow overriding version with rbenv shell' {
  cd_into_project_with_gemfile "'" 1.2.3
  create_version 4.5.6
  export RBENV_VERSION=4.5.6
  run rbenv bundler-ruby-version
  assert_success ''
}

@test 'Recognize simple ruby version in single quotes with leading spaces' {
  mkdir -p "$EXAMPLE_APP_DIR"
  cd "$EXAMPLE_APP_DIR"
  echo "  ruby '1.2.3'" > "$EXAMPLE_APP_DIR/Gemfile"
  run rbenv bundler-ruby-version
  assert_success '1.2.3'
}

@test 'Recognize simple ruby version in single quotes' {
  cd_into_project_with_gemfile "'" 1.2.3
  run rbenv bundler-ruby-version
  assert_success '1.2.3'
}

@test 'Recognize simple ruby version in double quotes' {
  cd_into_project_with_gemfile '"' 1.2.3
  run rbenv bundler-ruby-version
  assert_success '1.2.3'
}

@test 'Recognize simple ruby version with comment' {
  cd_into_project_with_gemfile "'" 1.2.3 '# a comment'
  run rbenv bundler-ruby-version
  assert_success '1.2.3'
}

@test 'Recognize jruby ruby version in single quotes with extra spaces' {
  cd_into_project_with_gemfile '"' 1.2.3 ",   :engine => 'jruby',   :engine_version => '1.6.7'  "
  run rbenv bundler-ruby-version
  assert_success 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in single quotes' {
  cd_into_project_with_gemfile '"' 1.2.3 ", :engine => 'jruby', :engine_version => '1.6.7'"
  run rbenv bundler-ruby-version
  assert_success 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in double quotes' {
  cd_into_project_with_gemfile '"' 1.2.3 ', :engine => "jruby", :engine_version => "1.6.7"'
  run rbenv bundler-ruby-version
  assert_success 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in single quotes reversed' {
  cd_into_project_with_gemfile '"' 1.2.3 ", :engine_version => '1.6.7', :engine => 'jruby'"
  run rbenv bundler-ruby-version
  assert_success 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in double quotes reversed' {
  cd_into_project_with_gemfile '"' 1.2.3 ', :engine_version => "1.6.7", :engine => "jruby"'
  run rbenv bundler-ruby-version
  assert_success 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in single quotes' {
  cd_into_project_with_gemfile '"' 1.2.3 ", engine: 'jruby', engine_version: '1.6.7'"
  run rbenv bundler-ruby-version
  assert_success 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in double quotes' {
  cd_into_project_with_gemfile '"' 1.2.3 ', engine: "jruby", engine_version: "1.6.7"'
  run rbenv bundler-ruby-version
  assert_success 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in single quotes reversed' {
  cd_into_project_with_gemfile '"' 1.2.3 ", engine_version: '1.6.7', engine: 'jruby'"
  run rbenv bundler-ruby-version
  assert_success 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in double quotes reversed' {
  cd_into_project_with_gemfile '"' 1.2.3 ', engine_version: "1.6.7", engine: "jruby"'
  run rbenv bundler-ruby-version
  assert_success 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version with comments' {
  cd_into_project_with_gemfile '"' 1.2.3 ', engine_version: "1.6.7", engine: "jruby" # a comment'
  run rbenv bundler-ruby-version
  assert_success 'jruby-1.6.7'
}

