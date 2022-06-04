defmodule Elibrary.Accounts.Queries.GetUserTest do
  use Elibrary.DataCase

  alias Elibrary.Accounts
# @tag :xo
  test "process/1 get user by id" do
    user = insert(:user)|> IO.inspect()
    Accounts.Entities.User.create_changeset(user, %{})
    Accounts.get_user(user.id)
    assert {:ok, result} = Accounts.get_user(user.id)
    assert user.id == result.id
  end
end
