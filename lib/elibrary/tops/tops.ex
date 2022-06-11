defmodule Elibrary.Tops do
  alias Elibrary.Tops.Commands.{
    CreateTop
  }

  alias Elibrary.Tops.Queries.{
    AvgEstimationBook,
    AvgEstimationComment,
    GetTop
  }

  alias Elibrary.Tops.Commands.{
    UpdateTop,
    DeleteTop
  }

  defdelegate avg_estimation_book(book_id), to: AvgEstimationBook, as: :process
  defdelegate avg_estimation_comment(comment_id), to: AvgEstimationComment, as: :process
  defdelegate get_top(id), to: GetTop, as: :process
  defdelegate create_top(attrs), to: CreateTop, as: :process
  defdelegate update_top(top, attrs), to: UpdateTop, as: :process
  defdelegate delete_top(top), to: DeleteTop, as: :process
end
