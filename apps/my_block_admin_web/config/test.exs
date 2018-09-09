use Mix.Config

config :my_block_admin_web, MyBlockAdminWeb.Endpoint,
  http: [port: 3001],
  server: true

config :phoenix_integration,
  endpoint: MyBlockAdminWeb.Endpoint

config :hound, driver: "phantomjs"

# Print only warnings and errors during test
config :logger, level: :warn
