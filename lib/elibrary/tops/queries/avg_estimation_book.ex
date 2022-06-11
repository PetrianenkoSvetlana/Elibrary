defmodule Elibrary.Tops.Queries.AvgEstimationBook do
  import Ecto.Query, only: [from: 2]

  alias Elibrary.{
    Repo,
    Tops.Entities.Top
  }

  def process (book_id) do
    Top
    |> by_book(book_id)
    |> Repo.aggregate(:avg, :estimation)
    |> Decimal.round(2)
  end

  defp by_book(query, book_id) do
    from top in query,
      where: top.book_id == ^book_id
  end

  # defp avg(query) do
  #   from top in query,
  #     select: AVG(top.estimation)
  # end
end
