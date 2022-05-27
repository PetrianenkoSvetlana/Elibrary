defmodule Elibrary.Books.Queries.ListBooksTest do
  use Elibrary.DataCase

  alias Elibrary.Books

  test "process/1 list_books test" do
    insert_list(15, :book)
    result = Books.list_books()
    assert length(result) == 15
  end
end
