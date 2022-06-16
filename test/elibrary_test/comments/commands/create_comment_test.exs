defmodule Elibrary.Comments.Commands.CreateCommentTest do
  use Elibrary.DataCase

  alias Elibrary.Comments

  test "process/1 create_comment test" do
    user = insert(:user)
    book = insert(:book)

    attrs = %{
      comment: "Noy bad!",
      book_id: book.id,
      user_id: user.id
    }

    assert {:ok, _create_comment} = Comments.create_comment(attrs)
  end
end
