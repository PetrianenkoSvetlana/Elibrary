defmodule ElibraryWeb.V1.BooksController do
  use ElibraryWeb, :controller

  alias Elibrary.Books
  # alias Elibrary.Comments

  action_fallback(ElibraryWeb.FallbackController)

  def show(conn, %{"id" => id}) do
    with {:ok, book} <- Books.get_book(id) do
      render(conn, "show.json", %{book: book})
    end
  end

  def index(conn, params) do
    page = Books.list_books(params)
    render(conn, "index.json", %{page: page})
  end
end
