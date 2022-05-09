defmodule Elibrary.Accounts.Commands.UpdateUser do
  alias Elibrary.Accounts.Entities.User
  alias Elibrary.Repo

  def process(%User{} = user, attrs) do
    user
    |> User.update_changeset(attrs)
    |> Repo.update()
  end
end
