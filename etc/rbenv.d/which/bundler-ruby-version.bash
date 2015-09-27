RBENV_BUNDLER_VERSION=$(rbenv-bundler-ruby-version)

if [ -n "$RBENV_BUNDLER_VERSION" ]; then
  RBENV_COMMAND_PATH="${RBENV_ROOT}/versions/${RBENV_BUNDLER_VERSION}/bin/${RBENV_COMMAND}"

  if ! [ -d "${RBENV_ROOT}/versions/${RBENV_BUNDLER_VERSION}" ]; then
    echo "bundler-ruby-version: version \`$RBENV_BUNDLER_VERSION' is not installed" >&2
    exit 1
  fi
fi
