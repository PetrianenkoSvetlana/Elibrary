defmodule Elibrary.Tops.Queries.AvgEstimationBookTest do
  use Elibrary.DataCase

  alias Elibrary.Tops

  test "process/1 avg_estimation_book test" do
    [user_1, user_2] = insert_list(2, :user)
    book = insert(:book)
    Tops.create_top(%{estimation: 3, user_id: user_1.id, book_id: book.id})
    Tops.create_top(%{estimation: 4, user_id: user_2.id, book_id: book.id})
    assert 3.5 == Tops.avg_estimation_book(book.id)
  end
end
