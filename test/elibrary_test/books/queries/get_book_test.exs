defmodule Elibrary.Books.Queries.GetBookTest do
  use Elibrary.DataCase

  alias Elibrary.Books

  test "process/1 get book by id" do
    book = insert(:book)
    Books.get_book(book.id)
    assert {:ok, result} = Books.get_book(book.id)
    assert book.id == result.id
  end
end
