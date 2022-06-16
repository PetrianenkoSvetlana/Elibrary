defmodule Elibrary.Tags.Queries.ListTagsTest do
  use Elibrary.DataCase

  alias Elibrary.Tags

  test "process/1 list_tags test" do
    tags_1 = insert_list(3, :tag)
    tags_2 = insert_list(3, :tag)
    book_1 = insert(:book, %{tags: tags_2})
    insert(:book, %{tags: tags_1})
    assert length(Tags.list_tags(book_1.id)) == 3
  end
end
