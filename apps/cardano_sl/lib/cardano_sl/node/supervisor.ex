defmodule CardanoSL.Node.Supervisor do
  use Supervisor

  alias CardanoSL.Node
  alias CardanoSL.Node.Server, as: NodeServer

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_arg) do
    [mainnet_production_node] = Application.get_env(:cardano_sl, :nodes)
    children = [
      %{
        id: CardanoSL.Node.MainnetProducationServer,
        start:
          {NodeServer, :start_link, [struct(Node, mainnet_production_node)]},
        restart: :transient,
        shutdown: 5_000,
        type: :worker
      }
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
