defmodule Elibrary.Comments.Queries.ListComments do
  #Импортируем только с двумя аргументами
  # import Ecto.Query, only: [from: 2]

  alias Elibrary.Comments.Entities.Comment
  alias Elibrary.Repo

  def process do
    Repo.all(Comment)
  end

  
    # def process(book, params) do
      # Comment
      # |> by_book(book.id)
      # |> with_comment(params)
      # |> with_email(params)
      # |> select_fields()
      # |> Repo.paginate(params)
    # end

    # defp by_book(query, book_id) do
      # from comment in query,
      # where: comment.book_id == ^book_id
    # end

    # defp with_comment(query, %{comment: comment}) do
      # from comment in query,
      # where: comment.comment == ^comment
    # end

    # defp with_comment(query, _), do: query

    # defp with_email(query, %{email: email}) do
      # from comment in query,
      # where: comment.email == ^email
    # end

    # defp with_email(query, _), do: query

    # defp select_fields(query) do
      # from comment in query,
        # order_by: [asc: :inserted_at],
        # select: %{id: comment.id, email: comment.email}
    # end
end
