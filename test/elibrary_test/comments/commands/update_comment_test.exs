defmodule Elibrary.Comments.Commands.UpdateCommentTest do
  use Elibrary.DataCase

  alias Elibrary.Comments

  test "process/2 update_comment test" do
    comment = insert(:comment, %{comment: "higyuhiuggoi"})
    attrs = %{comment: "sdasaawda"}
    assert {:ok, updated_comment} = Comments.update_comment(comment, attrs)
    assert updated_comment.comment == attrs.comment
  end
end
