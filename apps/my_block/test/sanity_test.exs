defmodule MyBlock.SanityTest do
  use ExUnit.Case, async: true

  @moduletag :unit_test

  test "the truth" do
    # credo:disable-for-next-line Credo.Check.Warning.OperationOnSameValues
    assert true == true
  end

  test "1 + 1" do
    assert 1 + 1 == 2
  end
end
