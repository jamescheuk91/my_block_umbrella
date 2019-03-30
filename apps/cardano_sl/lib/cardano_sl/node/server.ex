defmodule CardanoSL.Node.Server do
  use GenServer
  require Logger

  alias CardanoSL.Node

  # Client
  def start_link(%Node{id: node_id} = args) do
    Logger.info(fn -> "#{__MODULE__}.start_link/1 args: #{inspect(args)}" end)
    opts = [name: via_tuple(node_id)]
    Logger.debug(fn -> "#{__MODULE__} GenServer.start_link with args: #{inspect(args)}, opts: #{inspect(opts)}" end)
    GenServer.start_link(__MODULE__, args, opts)
  end


  @spec fetch_node(node_id :: atom()) :: Node.t()
  def fetch_node(node_id) do
    Logger.debug(fn -> "#{__MODULE__}.fetch_node/1, node_id: #{node_id}" end)
    node_id
    |> via_tuple()
    |> GenServer.call(:fetch_node)
  end

  def fetch_node_info(node_id) do
    Logger.debug(fn -> "#{__MODULE__}.fetch_node_info/1, node_id: #{node_id}" end)
    node_id
    |> via_tuple()
    |> GenServer.call(:fetch_node_info)
  end

  def refresh_node_info(node_id) do
    Logger.debug(fn -> "#{__MODULE__}.refresh_node_info/1, node_id: #{node_id}" end)
    node_id
    |> via_tuple()
    |> GenServer.cast(:refresh_node_info)
  end

  defp via_tuple(node_id) do
    {:via, :swarm, node_id}
  end

  # Server (callbacks)
  @impl GenServer
  def init(%CardanoSL.Node{} = args) do
    Logger.info(fn -> "#{__MODULE__}.init/1 args: #{inspect(args)}" end)
    {:ok, args}
  end

  @impl GenServer
  def handle_call(:fetch_node, _from, %CardanoSL.Node{} = node) do
    {:reply, node, node}
  end

  @impl GenServer
  def handle_call(:fetch_node_info, _from, %CardanoSL.Node{node_info: node_info} = node) do
    {:reply, node_info, node}
  end

  @impl GenServer
  def handle_cast(:refresh_node_info, node) do
    case refresh_node_info_api_call(node) do
      nil ->
        {:noreply, node}

      new_node_info ->
        new_node = %CardanoSL.Node{ node | node_info: new_node_info}
        {:noreply, new_node}
    end
  end

  defp refresh_node_info_api_call(node) do
    Logger.debug(fn -> "#{__MODULE__}.refresh_node_info/0" end)
    uri = %URI{scheme: node.wallet_api_scheme, host: node.wallet_api_host, port: node.wallet_api_port}
    case CardanoSLWalletBackend.APIClient.node_info(uri) do
      {:error, reason} ->
        Logger.debug(fn -> "#{__MODULE__}.refresh_node_info/0 error: #{inspect(reason)}" end)
        nil

      {:ok, node_info} ->
        Logger.debug(fn ->
          "#{__MODULE__}.refresh_node_info/0 node_info: #{inspect(node_info)}"
        end)

        node_info
    end
  end
end
