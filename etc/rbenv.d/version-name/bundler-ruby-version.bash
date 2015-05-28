RBENV_BUNDLER_VERSION=$(rbenv-bundler-ruby-version)

if [ -n "$RBENV_BUNDLER_VERSION" ]; then
  RBENV_VERSION="${RBENV_BUNDLER_VERSION}"
fi
