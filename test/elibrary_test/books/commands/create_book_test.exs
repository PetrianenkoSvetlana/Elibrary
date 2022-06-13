defmodule Elibrary.Books.Commands.CreateBookTest do
  use Elibrary.DataCase

  alias Elibrary.Books

  test "process/1 create_book test" do
    tags = insert_list(2, :tag)

    attrs = %{
      title: "Война и пух",
      ISBN: "877688h77h6",
      author: "Доналд Кук",
      publisher: "Star Wars",
      thematics: "horror",
      tags: tags
    }

    assert {:ok, create_book} = Books.create_book(attrs)
    assert create_book.tags == tags
  end
end
