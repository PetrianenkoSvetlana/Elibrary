defmodule Elibrary.Tops.Commands.DeleteTop do
  alias Elibrary.Repo
  alias Elibrary.Tops.Entities.Top

  def process(%Top{} = top) do
    Repo.delete(top)
  end
end
