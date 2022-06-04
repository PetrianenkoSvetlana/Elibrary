defmodule Elibrary.Comments.Queries.GetComment do
  alias Elibrary.Comments.Entities.Comment
  alias Elibrary.Repo

  def process(id) do
    Repo.find(Comment, id)
  end
end
