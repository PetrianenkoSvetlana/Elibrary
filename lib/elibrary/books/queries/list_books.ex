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
    |> filter(params)
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
      where: ilike(tags.tag, ^tag)

    # preload: [tags: tags]
  end

  defp with_tags(query, _), do: query

  defp filter(query, %{from: from, to: to}) do
    from book in query,
      where: book.creation_year >= ^from and book.creation_year <= ^to
  end

  defp filter(query, %{from: from}) do
    from book in query,
      where: book.creation_year >= ^from
  end

  defp filter(query, %{to: to}) do
    from book in query,
      where: book.creation_year <= ^to
  end

  defp filter(query, _), do: query
end
