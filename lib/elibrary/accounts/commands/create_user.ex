defmodule Elibrary.Accounts.Commands.CreateUser do
  alias Elibrary.Accounts.Entities.User
  alias Elibrary.Repo

  def process(attrs) do
    %User{}
    |> User.create_changeset(attrs)
    |> Repo.insert()
  end
end
