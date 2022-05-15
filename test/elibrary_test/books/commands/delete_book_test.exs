defmodule Elibrary.Books.Commands.DeleteBookTest do
  use Elibrary.DataCase

  alias Elibrary.Books
  @tag :xo

  test "process/1 delete_book test" do
    book = insert(:book)
    assert {:ok, _result} = Books.delete_book(book)
    assert {:error, :not_found} = Books.get_book(book.id)
  end
end
