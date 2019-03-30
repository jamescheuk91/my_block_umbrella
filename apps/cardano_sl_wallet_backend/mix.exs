defmodule CardanoSLWalletBackend.MixProject do
  use Mix.Project

  def project do
    [
      app: :cardano_sl_wallet_backend,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "1.7.3",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    extra_applications = extra_applications(Mix.env())

    [
      extra_applications: extra_applications
    ]
  end

  defp extra_applications() do
    [:logger, :httpoison]
  end

  defp extra_applications(:dev) do
    extra_applications() ++ [:exsync]
  end

  defp extra_applications(:test) do
    extra_applications() ++ [:exvcr]
  end

  defp extra_applications(:prod) do
    extra_applications() ++ []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:exsync, "0.2.3", only: :dev},
      {:exvcr, "~> 0.10", only: :test},
      {:httpoison, "1.3.0"},
      {:jason, "~> 1.1"},
      {:utilities, in_umbrella: true}
    ]
  end
end
