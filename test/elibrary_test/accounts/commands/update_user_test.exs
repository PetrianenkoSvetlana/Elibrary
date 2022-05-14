defmodule Elibrary.Accounts.Commands.UpdateUserTest do
  use Elibrary.DataCase

  alias Elibrary.Accounts

  test "process/1 update_user test" do
    user = insert(:user, %{email: "non_updated@email.com"})
    attrs = %{email: "update@em.com"}
    assert {:ok, updated_user} = Accounts.update_user(user, attrs)
    assert updated_user.email == attrs.email
  end
end
