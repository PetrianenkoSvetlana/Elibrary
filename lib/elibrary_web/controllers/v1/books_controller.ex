defmodule ElibraryWeb.V1.BooksController do
  use ElibraryWeb, :controller

  alias Elibrary.Books
  alias Elibrary.Tags
  alias Elibrary.Comments

  action_fallback(ElibraryWeb.FallbackController)

  def show(conn, %{"id" => id} = params) do
    with {:ok, book} <- Books.get_book(id),
         tags <- Tags.list_tags(id),
         page <- Comments.list_comments(id, params) do
      render(conn, "show.json", %{book: book, tags: tags, page: page})
    end
  end

  def index(conn, params) do
    page = Books.list_books(params)
    render(conn, "index.json", %{page: page})
  end
end
