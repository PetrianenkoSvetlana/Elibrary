defmodule ElibraryWeb.V1.BooksView do
  use ElibraryWeb, :view

  def render("show.json", %{book: book}) do
    %{
      id: book.id,
      title: book.title,
      ISBN: book."ISBN",
      type: book.type,
      author: book.author,
      publisher: book.publisher,
      language: book.language,
      country: book.country,
      creation_year: book.creation_year,
      thematics: book.thematics,
      date_of_publication: book.date_of_publication,
      top: book.top
    }
  end

  def render("index.json", %{page: page}) do
    %{
      entries: render_many(page.entries, __MODULE__, "index_show.json", as: :book),
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("index_show.json", %{book: book}) do
    %{
      title: book.title,
      type: book.type,
      author: book.author,
      publisher: book.publisher,
      language: book.language,
      creation_year: book.creation_year,
      thematics: book.thematics,
      top: book.top
    }
  end
end
