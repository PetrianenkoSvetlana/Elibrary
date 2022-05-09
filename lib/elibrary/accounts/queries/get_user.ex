defmodule Elibrary.Accounts.Queries.GetUser do
  alias Elibrary.Accounts.Entities.User
  alias Elibrary.Repo

  def process(id) do
    Repo.find(User, id)
  end
end
