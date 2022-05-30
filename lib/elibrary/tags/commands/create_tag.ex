defmodule Elibrary.Tags.Commands.CreateTag do
  alias Elibrary.Tags.Entities.Tag
  alias Elibrary.Repo

  def process(attrs) do
    %Tag{}
    |> Tag.create_changeset(attrs)
    |> Repo.insert()
  end
end
