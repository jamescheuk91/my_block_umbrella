defmodule CardanoSLWalletBackend do
  @moduledoc """
  Define a CardanoSLWalletBackend.
  """

  @type node_info :: %{}

  @type metadata :: %{}

  @type sync_progress :: %{}

  @doc """
  Retrieves the dynamic information for this node.
  """
  @callback node_info(URI.t()) :: {:error, atom()} | {:ok, map()}
end
