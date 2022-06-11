defmodule Elibrary.Comments.Queries.ListCommentsTest do
  use Elibrary.DataCase

  alias Elibrary.Comments

  test "process/2 list_comments test" do
    book_1 = insert(:book)
    book_2 = insert(:book)
    insert_list(2, :comment, %{book_id: book_1})
    insert_list(2, :comment, %{book_id: book_2})
    result = Comments.list_comments(book_1.id)
    # assert length(result) == 2
  end
end
