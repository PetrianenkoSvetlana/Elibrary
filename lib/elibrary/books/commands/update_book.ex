defmodule Elibrary.Books.Commands.UpdateBook do
  alias Elibrary.Books.Entities.Book
  alias Elibrary.Repo

  def process(%Book{} = book, attrs) do
    book
    |> Book.update_changeset(attrs)
    |> Repo.update()
  end
end
