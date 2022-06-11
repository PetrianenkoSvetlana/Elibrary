defmodule Elibrary.Tags.Commands.UpdateTagTest do
  use Elibrary.DataCase

  alias Elibrary.Tags

  test "process/2 update_tag test" do
    tag = insert(:tag, %{tag: "retern"})
    attrs = %{tag: "super"}
    assert {:ok, updated_tag} = Tags.update_tag(tag, attrs)
    assert updated_tag.tag == attrs.tag
  end
end
