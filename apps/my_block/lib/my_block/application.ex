defmodule MyBlock.Application do
  @moduledoc """
  The MyBlock Application Service.

  The my_block system business domain lives in this application.

  Exposes API to clients such as the `MyBlockWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    # Define workers and child supervisors to be supervised
    children = [
      %{
        id: MyBlock.Repo,
        start: {MyBlock.Repo, :start_link, []},
        restart: :permanent,
        type: :supervisor
      }
    ]

    opts = [strategy: :one_for_one, name: MyBlock.Supervisor]
    Logger.add_backend(Sentry.LoggerBackend)
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    Supervisor.start_link(children, opts)
  end
end
