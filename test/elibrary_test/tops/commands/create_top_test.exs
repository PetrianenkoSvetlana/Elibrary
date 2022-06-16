defmodule Elibrary.Tops.Commands.CreateTopTest do
  use Elibrary.DataCase

  alias Elibrary.Tops

  test "process/1 create_top for book test" do
    user = insert(:user)
    book = insert(:book)
    assert {:ok, top} = Tops.create_top(%{estimation: 3, user_id: user.id, book_id: book.id})
    assert top.user_id == user.id
  end

  test "process/1 create_top for comment test" do
    user = insert(:user)
    comment = insert(:comment)

    assert {:ok, top} =
             Tops.create_top(%{estimation: 3, user_id: user.id, comment_id: comment.id})

    assert top.user_id == user.id
  end
end
