use Mix.Config

config :my_block_web, MyBlockWeb.Endpoint,
  http: [port: 4001],
  server: true

config :phoenix_integration,
  endpoint: MyBlockWeb.Endpoint

config :hound, driver: "phantomjs"
