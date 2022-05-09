defmodule Elibrary.Accounts.Commands.DeleteUser do
  alias Elibrary.Accounts.Entities.User
  alias Elibrary.Repo

  def process(%User{} = user) do
    Repo.delete(user)
  end
end
