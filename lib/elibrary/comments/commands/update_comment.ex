defmodule Elibrary.Comments.Commands.UpdateComment do
  alias Elibrary.Comments.Entities.Comment
  alias Elibrary.Repo

  def process(%Comment{} = comment, attrs) do
    comment
    |> Comment.update_changeset(attrs)
    |> Repo.update()
  end
end
