defmodule RagErlangVmTest do
  use ExUnit.Case
  doctest RagErlangVm

  test "greets the world" do
    assert RagErlangVm.hello() == :world
  end
end
