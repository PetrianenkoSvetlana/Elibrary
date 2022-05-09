defmodule Elibrary.Accounts.Queries.ListUsers do
  alias Elibrary.Accounts.Entities.User
  alias Elibrary.Repo

  def process do
    Repo.all(User)
  end
end
