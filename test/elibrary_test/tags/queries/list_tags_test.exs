defmodule Elibrary.Tags.Queries.ListTagsTest do
  use Elibrary.DataCase

  alias Elibrary.Tags

  test "process/1 list_tags test" do
    insert_list(5, :tag)
    result = Tags.list_tags()
    assert length(result) == 5
  end
end
