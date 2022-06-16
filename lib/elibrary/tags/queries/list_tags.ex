defmodule Elibrary.Tags.Queries.ListTags do
  import Ecto.Query, only: [from: 2]

  # alias Elibrary.Tags.Entities.Tag
  alias Elibrary.Books.Entities.Book
  alias Elibrary.Repo

  def process(book_id) do
    Book
    |> by_book(book_id)
    |> Repo.all()
  end

  defp by_book(query, book_id) do
    from book in query,
      join: tag in assoc(book, :tags),
      select: tag,
      where: book.id == ^book_id
  end
end
