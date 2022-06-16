defmodule Elibrary.Accounts.Auth do
  alias Elibrary.Accounts.Entities.User
  alias Elibrary.Accounts.Services.Guardian

  def sign_user(%User{} = user), do: Guardian.sign(user)
end
