defmodule Elibrary.Tops.Commands.CreateTopTest do
  use Elibrary.DataCase

  alias Elibrary.Tops

  test "process/1 create_top test" do
    user = insert(:user)
    assert {:ok, top} = Tops.create_top(%{estimation: 3, user_id: user.id})
    assert top.user_id == user.id
  end
end
