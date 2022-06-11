defmodule Elibrary.Comments.Queries.ListComments do
  import Ecto.Query, only: [from: 2]

  # alias Elibrary.Repo
  alias Elibrary.Comments.Entities.Comment

  def process(book_id) do
    Comment
    |> by_book(book_id)
  end

  defp by_book(query, book_id) do
    from comment in query,
      where: comment.book_id == ^book_id
  end
end
