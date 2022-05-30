defmodule Elibrary.Tags.Queries.ListTags do
  alias Elibrary.Tags.Entities.Tag
  alias Elibrary.Repo

  def process do
    Repo.all(Tag)
  end
end
