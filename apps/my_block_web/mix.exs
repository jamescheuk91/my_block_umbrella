defmodule MyBlockWeb.Mixfile do
  @moduledoc false
  use Mix.Project

  def project do
    {git_commit_hash, _} = System.cmd("git", ["rev-parse", "HEAD"])
    shorted_hash = git_commit_hash |> String.slice(0..6)

    [
      app: :my_block_web,
      version: "0.0.1-#{shorted_hash}",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "1.7.3",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
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
      mod: {MyBlockWeb.Application, []},
      extra_applications: [:logger, :runtime_tools],
      dialyzer: [plt_add_deps: :transitive]
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
      {:cowboy, "1.1.2"},
      {:phoenix, "1.3.4"},
      {:phoenix_pubsub, "1.1.0"},
      {:phoenix_ecto, "3.3.0"},
      {:phoenix_html, "2.12.0"},
      {:phoenix_live_reload, "~> 1.1.5", only: :dev},
      {:phoenix_integration, "~>  0.5.3", only: :test},
      {:hound, "~> 1.0.4", only: :test},
      {:gettext, "0.16.0"},
      {:my_block, in_umbrella: true}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, we extend the test task to create and migrate the database.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      unit_test: ["ecto.create --quiet", "ecto.migrate", "test --only unit_test"],
      controller_test: ["ecto.create --quiet", "ecto.migrate", "test --only controller_test"],
      integration_test: ["ecto.create --quiet", "ecto.migrate", "test --only integration_test"],
      e2e_test: ["ecto.create --quiet", "ecto.migrate", "test --only e2e_test"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
