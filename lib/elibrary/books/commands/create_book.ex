defmodule Elibrary.Books.Commands.CreateBook do
  alias Elibrary.Books.Entities.Book
  alias Elibrary.Repo

  def process(attrs) do
    %Book{}
    |> Book.create_changeset(attrs)
    |> Repo.insert()
  end
end
