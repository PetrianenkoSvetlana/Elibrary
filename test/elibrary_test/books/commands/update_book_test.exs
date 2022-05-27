defmodule Elibrary.Books.Commands.UpdateBookTest do
  use Elibrary.DataCase

  alias Elibrary.Books
  @tag :xo

  test "process/1 update_book test" do
    book = insert(:book, %{
      title: "Somebody",
      author: "Clock",
      publisher: "Home",
      thematics: "horror",
      type: "book",
      language: "france",
      country: "France"
    })
    attrs = %{
      title: "Кто-то",
      author: "Click",
      publisher: "HomeRU",
      thematics: "horror&roman",
      type: "poem",
      language: "russian",
      country: "Russia"
    }
    assert {:ok, updated_book} = Books.update_book(book, attrs)
    assert updated_book.title == attrs.title
    assert updated_book.author == attrs.author
    assert updated_book.publisher == attrs.publisher
    assert updated_book.thematics == attrs.thematics
    assert updated_book.type == attrs.type
    assert updated_book.language == attrs.language
    assert updated_book.country == attrs.country
  end
end
