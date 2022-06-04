defmodule Elibrary.Comments.Commands.CreateComment do
  alias Elibrary.Comments.Entities.Comment
  alias Elibrary.Repo

  def process(attrs) do
    %Comment{}
    |> Comment.create_changeset(attrs)
    |> Repo.insert()
  end
end
