defmodule Elibrary.Tops.Commands.CreateTop do
  alias Elibrary.{
    Repo,
    Tops.Entities.Top
  }

  def process(attrs) do
    %Top{}
    |> Top.create_changeset(attrs)
    |> Repo.insert()
  end
end
