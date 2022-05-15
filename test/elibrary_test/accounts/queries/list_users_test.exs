defmodule Elibrary.Accounts.Queries.ListUsersTest do
  use Elibrary.DataCase

  alias Elibrary.Accounts

  test "process/1 list_users test" do
    insert_list(5, :user)
    result = Accounts.list_users()
    assert length(result) == 5
  end
end
