defmodule Elibrary.Books.Queries.ListBooks do
  import Ecto.Query, only: [from: 2]

  alias Elibrary.Books.Entities.Book
  alias Elibrary.Repo

  def process(params) do
    Book
    |> with_title(params)
    |> with_author(params)
    |> with_publisher(params)
    |> with_tags(params)
    |> filter_with_top(params)
    |> filter_with_creation_year(params)
    |> search_with_top(params)
    |> search_with_creation_year(params)
    |> Repo.paginate(params)
  end

  defp with_title(query, %{title: title}) do
    title = "%" <> String.trim(title) <> "%"

    from book in query,
      where: ilike(book.title, ^title)
  end

  defp with_title(query, _), do: query

  defp with_author(query, %{author: author}) do
    author = "%" <> String.trim(author) <> "%"

    from book in query,
      where: ilike(book.author, ^author)
  end

  defp with_author(query, _), do: query

  defp with_publisher(query, %{publisher: publisher}) do
    publisher = "%" <> String.trim(publisher) <> "%"

    from book in query,
      where: ilike(book.publisher, ^publisher)
  end

  defp with_publisher(query, _), do: query

  defp with_tags(query, %{tag: tag}) do
    tag = "%" <> String.trim(tag) <> "%"

    from book in query,
      join: tags in assoc(book, :tags),
      where: ilike(tags.tag, ^tag),
      preload: [tags: tags]
  end

  defp with_tags(query, _), do: query

  defp filter_with_top(query, %{top: top}) do
    from book in query,
      where: book.top >= ^top
  end

  defp filter_with_top(query, _), do: query

  defp filter_with_creation_year(query, %{creation_year: creation_year}) do
    from book in query,
      where: book.creation_year >= ^creation_year
  end

  defp filter_with_creation_year(query, _), do: query

  defp search_with_top(query, %{top: top}) do
    from book in query,
      where: book.top == ^top
  end

  defp search_with_top(query, _), do: query

  defp search_with_creation_year(query, %{creation_year: creation_year}) do
    from book in query,
      where: book.creation_year == ^creation_year
  end

  defp search_with_creation_year(query, _), do: query
end
