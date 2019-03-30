defmodule CardanoSL do

  alias CardanoSL.Node
  alias CardanoSL.Node.Server, as: NodeServer

  @spec fetch_all_nodes() :: [CardanoSL.Node.t()]
  def fetch_all_nodes() do
    nodes()
    |> Enum.map(&struct(Node, &1))
    |> Enum.map(&NodeServer.fetch_node(&1.id))
  end

  @spec find_node(node_id :: atom()) ::
          {:ok, Node.t()} | {:error, :node_not_found}
  def find_node(node_id) do
    case fetch_all_nodes() |> Enum.find(fn %{id: id} -> id == node_id end) do
      nil -> {:error, :node_not_found}
      full_node -> {:ok, full_node}
    end
  end

  @spec refresh_node_info(node_id :: atom()) ::
          {:ok, Node.t()} | {:error, :node_not_found}
  def refresh_node_info(node_id) do
    case find_node(node_id) do
      {:error, :node_not_found} -> {:error, :node_not_found}
      {:ok, %CardanoSL.Node{id: node_id}} -> node_id |> NodeServer.refresh_node_info()
    end
  end

  defp nodes() do
    Application.get_env(:cardano_sl, :nodes) || raise "expected the :cardano_sl :nodes config to be set"
  end

end
