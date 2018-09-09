use Mix.Config

# Configures Sentry
config :sentry,
  enable_source_code_context: true,
  root_source_code_path: File.cwd!(),
  tags: %{
    env: "staging"
  }

import_config "stag.secret.exs"
