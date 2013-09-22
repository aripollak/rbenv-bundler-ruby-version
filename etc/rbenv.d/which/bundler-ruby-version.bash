RBENV_BUNDLER_VERSION=$(rbenv-bundler-ruby-version)

if [ -n "$RBENV_BUNDLER_VERSION" ]; then
  RBENV_COMMAND_PATH="${RBENV_ROOT}/versions/${RBENV_BUNDLER_VERSION}/bin/${RBENV_COMMAND}"
fi
