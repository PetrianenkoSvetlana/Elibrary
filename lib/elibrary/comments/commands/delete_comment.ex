defmodule Elibrary.Comments.Commands.DeleteComment do
  alias Elibrary.Comments.Entities.Comment
  alias Elibrary.Repo

  def process(%Comment{} = comment) do
    Repo.delete(comment)
  end
end
