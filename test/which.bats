#!/usr/bin/env bats

load test_helper

@test 'which recognizes ruby version in Gemfile' {
  create_version 1.8.7
  cd_into_project_with_gemfile "'" 1.8.7
  run rbenv which ruby
  assert_success "${RBENV_ROOT}/versions/1.8.7/bin/ruby"
}
