defmodule CardanoSLWalletBackend do
  @moduledoc """
  Define a CardanoSLWalletBackend.
  """
  @doc """
  Retrieves the dynamic information for this node.
  """
  @callback node_info() :: {:ok, map()}
end
