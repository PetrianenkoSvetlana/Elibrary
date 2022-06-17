defmodule ElibraryWeb.V1.BooksController do
  use ElibraryWeb, :controller

  alias Elibrary.Books
  alias Elibrary.Tags
  alias Elibrary.Comments
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
         tags <- Tags.list_tags(id),
         page <- Comments.list_comments(id, params) do
      render(conn, "show.json", %{book: book, tags: tags, page: page})
    end
  end

  def index(conn, params) do
    with {:ok, params} <- ApplyParams.do_apply(IndexBookParams, params) do
      page = Books.list_books(params)
      render(conn, "index.json", %{page: page})
    else
      {:error, %Changeset{} = changeset} ->
        with %Changeset{errors: errors} <- changeset,
             params <- not_error(params, errors) do
          {:ok, params} = ApplyParams.do_apply(IndexBookParams, params)
          page = Books.list_books(params)
          render(conn, "index.json", %{page: page})
        end
    end
  end

  defp not_error(params, errors) do
    fields = Enum.map(errors, fn {field, _} -> to_string(field) end)
    Map.drop(params, fields)
  end
end
