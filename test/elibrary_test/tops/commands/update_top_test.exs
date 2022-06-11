defmodule Elibrary.Tops.Commands.UpdateTopTest do
  use Elibrary.DataCase

  alias Elibrary.Tops

  test "process/2 update_top test" do
    top = insert(:top, %{estimation: 3})
    attrs = %{estimation: 5}
    assert {:ok, update_top} = Tops.update_top(top, attrs)
    assert update_top.estimation == attrs.estimation
  end
end
