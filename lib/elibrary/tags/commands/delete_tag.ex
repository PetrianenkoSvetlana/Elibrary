defmodule Elibrary.Tags.Commands.DeleteTag do
  alias Elibrary.Tags.Entities.Tag
  alias Elibrary.Repo

  def process(%Tag{} = tag) do
    Repo.delete(tag)
  end
end
