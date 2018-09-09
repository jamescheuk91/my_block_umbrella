use Mix.Config

config :my_block, ecto_repos: [MyBlock.Repo]

import_config "#{Mix.env()}.exs"
