defmodule Elibrary.Tops.Queries.AvgEstimationBook do
  import Ecto.Query, only: [from: 2]

  alias Elibrary.{
    Repo,
    Tops.Entities.Top
  }

  def process(book_id) do
    top =
      Top
      |> by_book(book_id)
      |> Repo.aggregate(:avg, :estimation)
      |> avg()

    %{top: top}
  end

  defp by_book(query, book_id) do
    from top in query,
      where: top.book_id == ^book_id
  end

  defp avg(num) do
    case num do
      nil -> 0
      _ -> Decimal.to_float(num)
    end
  end
end
