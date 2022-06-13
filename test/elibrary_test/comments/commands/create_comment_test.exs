defmodule Elibrary.Comments.Commands.CreateCommentTest do
  use Elibrary.DataCase

  alias Elibrary.Comments

  test "process/1 create_comment test" do
    user = insert(:user)
    book = insert(:book)
    attrs = %{
      comment: "Noy bad!",
      email: user.email,
      book_id: book.id,
      user_id: user.id
    }
    assert {:ok, create_comment} = Comments.create_comment(attrs)
    assert create_comment.email == user.email
  end
end
