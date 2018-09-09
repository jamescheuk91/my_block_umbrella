use Mix.Config

# Configure your database
config :my_block, MyBlock.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "my_block_dev",
  hostname: "localhost",
  pool_size: 10
