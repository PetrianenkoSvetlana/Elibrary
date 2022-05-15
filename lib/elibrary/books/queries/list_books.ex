defmodule Elibrary.Books.Queries.ListBooks do
  alias Elibrary.Books.Entities.Book
  alias Elibrary.Repo

  def process do
    Repo.all(Book)
  end
end
