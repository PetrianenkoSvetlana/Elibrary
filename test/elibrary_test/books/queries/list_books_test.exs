defmodule Elibrary.Books.Queries.ListBooksTest do
  use Elibrary.DataCase

  alias Elibrary.Books

  test "process/1 list_books test" do
    insert_list(4, :book)
    result = Books.list_books().entries
    assert length(result) == 4
  end
end
