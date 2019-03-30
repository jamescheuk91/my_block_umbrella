defmodule MyBlockAdminWeb.FullNodeController do
  use MyBlockAdminWeb, :controller

  def index(conn, _params) do
    cardano_sl_full_nodes = CardanoSL.all_nodes()

    conn
    |> render("index.html", cardano_sl_full_nodes: cardano_sl_full_nodes)
  end

  @spec show(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def show(conn, %{"fullnode_id" => fullnode_id}) do
    with {:ok, full_node} = CardanoSL.find_full_node(fullnode_id) do
      conn
      |> render("show.html", full_node: full_node)
    end
  end
end
