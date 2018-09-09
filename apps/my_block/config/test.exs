use Mix.Config

# Configure your database
config :my_block, MyBlock.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "my_block_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
