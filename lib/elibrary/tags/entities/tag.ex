defmodule Elibrary.Tags.Entities.Tag do
  use Ecto.Schema

  import Ecto.Changeset
  # alias Elibrary.Repo
  alias Elibrary.Books.Entities.Book
  alias Elibrary.Relations.BookTag

  @required [:tag]

  schema "tags" do
    field :tag, :string

    many_to_many :books, Book, join_through: BookTag

    timestamps()
  end

  def create_changeset(%__MODULE__{} = tag, attrs) do
    tag
    # |> Repo.preload(:books)
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:tag)
    # Set the association
    # |> put_assoc(:books, [attrs.books])
  end

  def update_changeset(%__MODULE__{} = tag, attrs) do
    tag
    # |> Repo.preload(:books)
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:tag)
    # Set the association
    # |> put_assoc(:books, [attrs.books])
  end
end
