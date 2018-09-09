defmodule MyBlock.Mixfile do
  @moduledoc false
  use Mix.Project

  def project do
    {git_commit_hash, _} = System.cmd("git", ["rev-parse", "HEAD"])
    shorted_hash = git_commit_hash |> String.slice(0..6)

    [
      app: :my_block,
      version: "0.0.1-#{shorted_hash}",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "1.7.3",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {MyBlock.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:postgrex, "0.13.5"},
      {:ecto, "2.2.10"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      unit_test: ["ecto.create --quiet", "ecto.migrate", "test --only unit_test"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
