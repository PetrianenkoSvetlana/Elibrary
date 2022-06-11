defmodule Elibrary.Tops.Commands.UpdateTop do
  alias Elibrary.{
    Repo,
    Tops.Entities.Top
  }

  def process(%Top{} = top, attrs) do
    top
    |> Top.update_changeset(attrs)
    |> Repo.update()
  end
end
