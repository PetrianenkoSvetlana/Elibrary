defmodule Elibrary.Tops.Queries.AvgEstimationComment do
  import Ecto.Query, only: [from: 2]

  alias Elibrary.{
    Repo,
    Tops.Entities.Top
  }

  def process(comment_id) do
    top =
      Top
      |> by_comment(comment_id)
      |> Repo.aggregate(:avg, :estimation)
      |> avg()

    %{top: top}
  end

  defp by_comment(query, comment_id) do
    from top in query,
      where: top.comment_id == ^comment_id
  end

  defp avg(num) do
    case num do
      nil -> 0
      _ -> Decimal.to_float(num)
    end
  end
end
