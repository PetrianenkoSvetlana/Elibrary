defmodule Elibrary.Tops.Queries.AvgEstimationComment do
  import Ecto.Query, only: [from: 2]

  alias Elibrary.{
    Repo,
    Tops.Entities.Top
  }

  def process (comment_id) do
    Top
    |> by_comment(comment_id)
    |> Repo.aggregate(:avg, :estimation)
    |> Decimal.round(2)
  end

  defp by_comment(query, comment_id) do
    from top in query,
      where: top.comment_id == ^comment_id
  end

  # defp avg(query) do
  #   from top in query,
  #     select: AVG(top.estimation)
  # end
end
