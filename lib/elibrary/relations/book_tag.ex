defmodule Elibrary.Relations.BookTag do
  use Ecto.Schema

  alias Elibrary.Books.Entities.Book
  alias Elibrary.Tags.Entities.Tag

  @primary_key false
  schema "books_tags" do
    belongs_to :book, Book
    belongs_to :tag, Tag

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> Ecto.Changeset.cast(params, [:book_id, :tag_id])
    |> Ecto.Changeset.validate_required([:book_id, :tag_id])
  end
end
