defmodule CardanoSL.Application do
  @moduledoc """
  The CardanoSL Application Service.
  """
  use Application
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    # Define workers and child supervisors to be supervised
    children = [
      %{
        id: CardanoSL.Node.Supervisor,
        start: {CardanoSL.Node.Supervisor, :start_link, []},
        restart: :permanent,
        type: :supervisor
      },
      %{
        id: CardanoSL.Scheduler,
        start: {CardanoSL.Scheduler, :start_link, []},
        restart: :permanent,
        type: :worker
      },
    ]

    opts = [strategy: :one_for_one, name: CardanoSL.Supervisor]
    Logger.add_backend(Sentry.LoggerBackend)
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    Supervisor.start_link(children, opts)
  end
end
