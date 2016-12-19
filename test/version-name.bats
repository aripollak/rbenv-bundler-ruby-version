#!/usr/bin/env bats

load test_helper

@test 'version-name continues to report default version if no Gemfile' {
  run rbenv version-name
  assert_success "system"
}

@test 'version-name recognizes ruby version in Gemfile' {
  create_version 1.8.7
  cd_into_project_with_gemfile "'" 1.8.7
  run rbenv version-name
  assert_success "1.8.7"
}
