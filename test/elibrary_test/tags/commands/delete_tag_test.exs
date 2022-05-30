defmodule Elibrary.Tags.Commands.DeleteTagTest do
  use Elibrary.DataCase

  alias Elibrary.Tags

  test "process/1 delete_tag test" do
    tag = insert(:tag)
    assert {:ok, _result} = Tags.delete_tag(tag)
    assert {:error, :not_found} = Tags.get_tag(tag.id)
  end
end
