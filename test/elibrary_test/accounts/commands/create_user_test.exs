defmodule Elibrary.Accounts.Commands.CreateUserTest do
  use Elibrary.DataCase

  alias Elibrary.Accounts

  test "process/1 create_user test" do
    attrs = %{
      email: "forman@mail.ru",
      password: "73940Jgu*7hj"
    }

    assert {:ok, create_user} = Accounts.create_user(attrs)
  end
end
