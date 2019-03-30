defmodule CardanoSL.Node do
  @moduledoc """
  A struct representing a Cardano SL Full Node.
  """

  use TypedStruct

  @typedoc "A Cardano SL Full Node"
  typedstruct do
    field :id, atom(), enforce: true
    field :network, atom(), enforce: true
    field :node_info, nil | map(), default: nil
    field :wallet_api_scheme, String.t(), enforce: true
    field :wallet_api_host, String.t(), enforce: true
    field :wallet_api_port, atom(), enforce: true
  end
end
