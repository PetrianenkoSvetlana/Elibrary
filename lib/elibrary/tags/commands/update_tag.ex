defmodule Elibrary.Tags.Commands.UpdateTag do
  alias Elibrary.Tags.Entities.Tag
  alias Elibrary.Repo

  def process(%Tag{} = tag, attrs) do
    tag
    |> Tag.update_changeset(attrs)
    |> Repo.update()
  end
end
