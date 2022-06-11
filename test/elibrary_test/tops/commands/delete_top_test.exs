defmodule Elibrary.Tops.Commands.DeleteTopTest do
  use Elibrary.DataCase

  alias Elibrary.Tops

  test "process/1 delete_top test" do
    top = insert(:top)
    assert {:ok, _result} = Tops.delete_top(top)
    assert {:error, :not_found} = Tops.get_top(top.id)
  end
end
