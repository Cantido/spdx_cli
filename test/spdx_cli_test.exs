defmodule SpdxCliTest do
  use ExUnit.Case
  doctest SpdxCli

  test "greets the world" do
    assert SpdxCli.hello() == :world
  end
end
