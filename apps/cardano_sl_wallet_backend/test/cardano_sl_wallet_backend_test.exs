defmodule CardanoSlWalletBackendTest do
  use ExUnit.Case
  doctest CardanoSlWalletBackend

  test "greets the world" do
    assert CardanoSlWalletBackend.hello() == :world
  end
end
