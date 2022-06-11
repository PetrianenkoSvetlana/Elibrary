defmodule Elibrary.Tops.Queries.GetTop do
  alias Elibrary.Repo
  alias Elibrary.Tops.Entities.Top

  def process(id) do
    Repo.find(Top, id)
  end
end
