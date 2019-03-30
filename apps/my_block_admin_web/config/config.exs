# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :my_block_admin_web,
  namespace: MyBlockAdminWeb

# Configures the endpoint
config :my_block_admin_web, MyBlockAdminWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8Rb5/uuIe9xed9kF/8TypyrircMTEUbuyksLVJCjnY0GDKiv1O4NTxLLljsHtFJB",
  render_errors: [view: MyBlockAdminWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyBlockAdminWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Drab
config :drab, MyBlockAdminWeb.Endpoint, otp_app: :my_block_admin_web

# Configures default Drab file extension
config :phoenix, :template_engines, drab: Drab.Live.Engine

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
