defmodule Elibrary.Comments.Queries.GetCommentTest do
  use Elibrary.DataCase

  alias Elibrary.Comments

  test "process/1 get comment by id" do
    comment = insert(:comment)
    assert {:ok, result} = Comments.get_comment(comment.id)
    assert comment.id == result.id
  end
end
