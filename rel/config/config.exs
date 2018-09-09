use Mix.Config

my_block_repo_database_url = "MY_BLOCK_REPO_DATABASE_URL" |> System.get_env()
  || raise "expected the MY_BLOCK_REPO_DATABASE_URL environment variable to be set"
my_block_web_port = "MY_BLOCK_WEB_PORT" |> System.get_env() |> String.to_integer()
  || raise "expected the MY_BLOCK_WEB_PORT environment variable to be set"
my_block_web_secret_key_base = "MY_BLOCK_WEB_SECRET_KEY_BASE" |> System.get_env()
  || raise "expected the MY_BLOCK_WEB_SECRET_KEY_BASE environment variable to be set"
my_block_admin_web_port = "MY_BLOCK_ADMIN_WEB_PORT" |> System.get_env() |> String.to_integer()
  || raise "expected the MY_BLOCK_ADMIN_WEB_PORT environment variable to be set"
my_block_admin_web_secret_key_base = "MY_BLOCK_ADMIN_WEB_SECRET_KEY_BASE" |> System.get_env()
  || raise "expected the MY_BLOCK_ADMIN_WEB_SECRET_KEY_BASE environment variable to be set"
sentry_dsn = "SENTRY_DSN" |> System.get_env()
  || raise "expected the SENTRY_DSN environment variable to be set"

config :my_block, MyBlock.Repo,
  url: my_block_repo_database_url

config :my_block_web, MyBlockWeb.Endpoint,
  http: [port: my_block_web_port],
  url: [host: "localhost", port: my_block_web_port],
  secret_key_base: my_block_web_secret_key_base

config :my_block_admin_web, MyBlockAdminWeb.Endpoint,
  http: [port: my_block_admin_web_port],
  url: [host: "localhost", port: my_block_admin_web_port],
  secret_key_base: my_block_admin_web_secret_key_base

config :sentry,
  dsn: sentry_dsn
