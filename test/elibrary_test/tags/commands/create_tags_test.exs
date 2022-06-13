defmodule Elibrary.Tags.Commands.CreateTagTest do
  use Elibrary.DataCase

  alias Elibrary.Tags

  test "process/1 create_tag test" do
    attrs = %{
      tag: "horror"
    }
    assert {:ok, create_tag} = Tags.create_tag(attrs)
  end
end
