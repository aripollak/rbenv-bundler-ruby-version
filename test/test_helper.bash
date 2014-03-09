EXAMPLE_APP_DIR="$BATS_TMPDIR/example_app"
TEST_BASENAME="$(basename $BATS_TEST_DIRNAME)"
PLUGIN_ROOT="${BATS_TEST_DIRNAME%${TEST_BASENAME}}"

setup() {
  export RBENV_ROOT="$BATS_TMPDIR/rbenv_root"
  mkdir -p "$RBENV_ROOT/plugins"
  ln -s "$PLUGIN_ROOT" "$RBENV_ROOT/plugins/bundler-ruby-version"
}

teardown() {
  rm -r "$EXAMPLE_APP_DIR"
  rm -r "$RBENV_ROOT"
}

assert() {
  if ! "$@"; then
    flunk "failed: $@"
  fi
}

assert_equal() {
  if [ "$1" != "$2" ]; then
    { echo "expected: $1"
      echo "actual:   $2"
    } | flunk
  fi
}

assert_output() {
  local expected
  if [ $# -eq 0 ]; then expected="$(cat -)"
  else expected="$1"
  fi
  assert_equal "$expected" "$output"
}

assert_success() {
  if [ "$status" -ne 0 ]; then
    flunk "command failed with exit status $status"
  elif [ "$#" -gt 0 ]; then
    assert_output "$1"
  fi
}

# cd_into_project_with_gemfile quote_char ruby_version [extra_args]
cd_into_project_with_gemfile() {
  local q="$1"
  mkdir -p "$EXAMPLE_APP_DIR"
  cd "$EXAMPLE_APP_DIR"
  echo "ruby ${q}${2}${q}${3}" > "$EXAMPLE_APP_DIR/Gemfile"
}

# Creates fake version directory
create_version() {
  d="$RBENV_ROOT/versions/$1/bin"
  mkdir -p "$d"
  ln -s /bin/echo "$d/ruby"
}

flunk() {
  { if [ "$#" -eq 0 ]; then cat -
    else echo "$@"
    fi
  } >&2
  return 1
}
