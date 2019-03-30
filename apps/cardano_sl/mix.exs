defmodule CardanoSL.MixProject do
  use Mix.Project

  def project do
    [
      app: :cardano_sl,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
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
      mod: {CardanoSL.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cardano_sl_wallet_backend, in_umbrella: true},
      {:quantum, "~> 2.3"},
      {:swarm, "~> 3.4.0"},
      {:timex, "~> 3.0"},
      {:typed_struct, "~> 0.1.3"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  defp aliases do
    []
  end
end
