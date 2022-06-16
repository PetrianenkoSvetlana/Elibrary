defmodule Elibrary.Tops.Queries.AvgEstimationCommentTest do
  use Elibrary.DataCase

  alias Elibrary.Tops

  test "process/1 avg_estimation_comment test" do
    [user_1, user_2] = insert_list(2, :user)
    comment = insert(:comment)
    Tops.create_top(%{estimation: 3, user_id: user_1.id, comment_id: comment.id})
    Tops.create_top(%{estimation: 4, user_id: user_2.id, comment_id: comment.id})
    assert %{top: 3.5} == Tops.avg_estimation_comment(comment.id)
  end
end
