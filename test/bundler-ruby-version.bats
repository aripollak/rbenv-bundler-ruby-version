#!/usr/bin/env bats

load test_helper

@test 'Recognize simple ruby version in single quotes' {
  cd_into_project_with_Gemfile "'" 1.2.3
  run rbenv-bundler-ruby-version
  assert_success
  assert_output '1.2.3'
}

@test 'Recognize simple ruby version in double quotes' {
  cd_into_project_with_Gemfile '"' 1.2.3
  run rbenv-bundler-ruby-version
  assert_success
  assert_output '1.2.3'
}

@test 'Recognize simple ruby version with comment' {
  cd_into_project_with_Gemfile "'" 1.2.3 '# a comment'
  run rbenv-bundler-ruby-version
  assert_success
  assert_output '1.2.3'
}

@test 'Recognize jruby ruby version in single quotes' {
  cd_into_project_with_Gemfile '"' 1.2.3 ", :engine => 'jruby', :engine_version => '1.6.7'"
  run rbenv-bundler-ruby-version
  assert_success
  assert_output 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in double quotes' {
  cd_into_project_with_Gemfile '"' 1.2.3 ', :engine => "jruby", :engine_version => "1.6.7"'
  run rbenv-bundler-ruby-version
  assert_success
  assert_output 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in single quotes reversed' {
  cd_into_project_with_Gemfile '"' 1.2.3 ", :engine_version => '1.6.7', :engine => 'jruby'"
  run rbenv-bundler-ruby-version
  assert_success
  assert_output 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in double quotes reversed' {
  cd_into_project_with_Gemfile '"' 1.2.3 ', :engine_version => "1.6.7", :engine => "jruby"'
  run rbenv-bundler-ruby-version
  assert_success
  assert_output 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in single quotes' {
  cd_into_project_with_Gemfile '"' 1.2.3 ", engine: 'jruby', engine_version: '1.6.7'"
  run rbenv-bundler-ruby-version
  assert_success
  assert_output 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in double quotes' {
  cd_into_project_with_Gemfile '"' 1.2.3 ', engine: "jruby", engine_version: "1.6.7"'
  run rbenv-bundler-ruby-version
  assert_success
  assert_output 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in single quotes reversed' {
  cd_into_project_with_Gemfile '"' 1.2.3 ", engine_version: '1.6.7', engine: 'jruby'"
  run rbenv-bundler-ruby-version
  assert_success
  assert_output 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version in double quotes reversed' {
  cd_into_project_with_Gemfile '"' 1.2.3 ', engine_version: "1.6.7", engine: "jruby"'
  run rbenv-bundler-ruby-version
  assert_success
  assert_output 'jruby-1.6.7'
}

@test 'Recognize jruby ruby version with comments' {
  cd_into_project_with_Gemfile '"' 1.2.3 ', engine_version: "1.6.7", engine: "jruby" # a comment'
  run rbenv-bundler-ruby-version
  assert_success
  assert_output 'jruby-1.6.7'
}

