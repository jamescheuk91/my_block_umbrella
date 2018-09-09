# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :my_block_web,
  namespace: MyBlockWeb,
  ecto_repos: [MyBlock.Repo]

# Configures the endpoint
config :my_block_web, MyBlockWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kTWZ83NSZWTvZT7cycbLcgbaPKoN9fjydbKil2ZQEUc07gdE8lIkmkFgyDKmuGKM",
  render_errors: [view: MyBlockWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyBlockWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :my_block_web, :generators, context_app: :my_block

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
