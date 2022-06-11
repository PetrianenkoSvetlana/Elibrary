defmodule Elibrary.Tops.Queries.GetTopTest do
  use Elibrary.DataCase

  alias Elibrary.Tops
  @tag :xp

  test "process/1 get_top test" do
    top = insert(:top)
    assert {:ok, result} = Tops.get_top(top.id)
    assert top.id == result.id
  end
end
