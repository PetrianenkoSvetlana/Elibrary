defmodule Elibrary.Books.Commands.DeleteBook do
  alias Elibrary.Books.Entities.Book
  alias Elibrary.Repo

  def process(%Book{} = book) do
    Repo.delete(book)
  end
end
