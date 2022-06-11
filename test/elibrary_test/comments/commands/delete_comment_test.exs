defmodule Elibrary.Comments.Commands.DeleteCommentTest do
  use Elibrary.DataCase

  alias Elibrary.Comments

  test "process/1 delete_comment test" do
    comment = insert(:comment)
    assert {:ok, _result} = Comments.delete_comment(comment)
    assert {:error, :not_found} = Comments.get_comment(comment.id)
  end
end
