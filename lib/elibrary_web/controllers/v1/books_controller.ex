defmodule ElibraryWeb.V1.BooksController do
  use ElibraryWeb, :controller

  alias Elibrary.Books
  alias Elibrary.Tags
  alias Elibrary.Comments
  alias Elibrary.Tops
  alias Ecto.Changeset

  action_fallback(ElibraryWeb.FallbackController)

  defmodule IndexBookParams do
    use Params.Schema, %{
      title: :string,
      author: :string,
      publisher: :string,
      tag: :string,
      from: :integer,
      to: :integer,
      page: :integer,
      page_size: :integer
    }
  end

  def show(conn, %{"id" => id} = params) do
    with {:ok, book} <- Books.get_book(id),
         {:ok, book} <- Books.update_book(book, Tops.avg_estimation_book(id)) do
      tags = Tags.list_tags(id)
      page = Comments.list_comments(id, params)

      Enum.map(page.entries, fn x ->
        {:ok, comment} = Comments.update_comment(x, Tops.avg_estimation_comment(x.id))
        comment
      end)

      render(conn, "show.json", %{book: book, tags: tags, page: page})
    end
  end

  def index(conn, params) do
    with {:ok, params} <- ApplyParams.do_apply(IndexBookParams, params) do
      page = Books.list_books(params)

      Enum.map(page.entries, fn x ->
        Books.update_book(x, Tops.avg_estimation_book(x.id))
      end)

      render(conn, "index.json", %{page: page})
    else
      {:error, %Changeset{} = changeset} ->
        with %Changeset{errors: errors} <- changeset,
             params <- not_error(params, errors) do
          {:ok, params} = ApplyParams.do_apply(IndexBookParams, params)
          page = Books.list_books(params)

          Enum.map(page.entries, fn x ->
            Books.update_book(x, Tops.avg_estimation_book(x.id))
          end)

          render(conn, "index.json", %{page: page})
        end
    end
  end

  defp not_error(params, errors) do
    fields = Enum.map(errors, fn {field, _} -> to_string(field) end)
    Map.drop(params, fields)
  end
end
