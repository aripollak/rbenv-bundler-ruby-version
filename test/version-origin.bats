#!/usr/bin/env bats

load test_helper

@test 'version-origin continues to report default version if no Gemfile' {
  run rbenv version-origin
  assert_success "${RBENV_ROOT}/version"
}

@test 'version-origin reports Gemfile if set by Gemfile' {
  cd_into_project_with_gemfile "'" 1.8.7
  run rbenv version-origin
  assert_success "Gemfile"
}
