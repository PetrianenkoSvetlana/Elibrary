defmodule Elibrary.Factories do
  use ExMachina.Ecto, repo: Elibrary.Repo

  use Elibrary.Factories.{
    Accounts.UserFactory,
    Books.BookFactory
  }
end
