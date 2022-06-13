defmodule Elibrary.Comments.Queries.ListCommentsTest do
  use Elibrary.DataCase

  alias Elibrary.Comments

  test "process/2 list_comments for book test" do
    book_1 = insert(:book)
    book_2 = insert(:book)
    user = insert(:user)
    insert_list(2, :comment, %{book: book_1, user: user})
    insert_list(2, :comment, %{book: book_2, user: user})
    result = Comments.list_comments(book_1.id).entries
    assert length(result) == 2
  end
end
