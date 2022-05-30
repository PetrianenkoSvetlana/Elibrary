defmodule Elibrary.Tags.Queries.GetTag do
  alias Elibrary.Tags.Entities.Tag
  alias Elibrary.Repo

  def process(id) do
    Repo.find(Tag, id)
  end
end
