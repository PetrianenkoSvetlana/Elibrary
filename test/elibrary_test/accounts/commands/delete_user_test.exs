defmodule Elibrary.Accounts.Commands.DeleteUserTest do
  use Elibrary.DataCase

  alias Elibrary.Accounts

  test "process/1 delete_user test" do
    user = insert(:user)
    assert {:ok, _result} = Accounts.delete_user(user)
    # |> IO.inspect()
    assert {:error, :not_found} = Accounts.get_user(user.id)
  end
end
