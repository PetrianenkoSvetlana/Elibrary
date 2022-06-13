defmodule Elibrary.Books.Commands.UpdateBookTest do
  use Elibrary.DataCase

  alias Elibrary.Books
  alias Elibrary.Tops

  test "process/2 update_book with comments test" do
    book =
      insert(:book, %{
        title: "Somebody",
        author: "Clock",
        publisher: "Home",
        thematics: "horror",
        type: "book",
        language: "france",
        country: "France",
        tags: insert(:tag)
      })

    attrs = %{
      title: "Кто-то",
      author: "Клок",
      publisher: "HomeRU",
      thematics: "horror&roman",
      type: "poem",
      language: "russian",
      country: "Russia",
      tags: [insert(:tag)],
      top: Tops.avg_estimation_book(book.id)
    }

    assert {:ok, updated_book} = Books.update_book(book, attrs)
    assert updated_book.title == attrs.title
    assert updated_book.author == attrs.author
    assert updated_book.publisher == attrs.publisher
    assert updated_book.thematics == attrs.thematics
    assert updated_book.type == attrs.type
    assert updated_book.language == attrs.language
    assert updated_book.country == attrs.country
    assert updated_book.tags == attrs.tags
    assert updated_book.top == attrs.top
  end
end
