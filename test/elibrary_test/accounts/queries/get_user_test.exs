defmodule Elibrary.Accounts.Queries.GetUserTest do
  use Elibrary.DataCase

  alias Elibrary.Accounts

  test "process/1 get user by id" do
    user = insert(:user)
    #IO.inspect(Elibrary.Accounts.create_user(%{"email" => "ama1@crm.ru", "password" => "57429086t", "birthday" => dateTim}))
    Accounts.Entities.User.create_changeset(user, %{})
    Accounts.get_user(user.id)
    assert {:ok, result} = Accounts.get_user(user.id)
    assert user.id == result.id
  end
end
