defmodule Elibrary.Books.Queries.GetBook do
  alias Elibrary.Books.Entities.Book
  alias Elibrary.Repo

  def process(id) do
    Repo.find(Book, id)
  end
end
