defmodule Elibrary.Tags.Queries.GetTagTest do
  use Elibrary.DataCase

  alias Elibrary.Tags

  test "process/1 get tag by id" do
    tag = insert(:tag)
    Tags.get_tag(tag.id)
    assert {:ok, result} = Tags.get_tag(tag.id)
    assert tag.id == result.id
  end
end
