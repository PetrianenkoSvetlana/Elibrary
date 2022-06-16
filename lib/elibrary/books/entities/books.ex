defmodule Elibrary.Books.Entities.Book do
  use Ecto.Schema

  import Ecto.Changeset

  alias Elibrary.Repo
  alias Elibrary.Tags.Entities.Tag
  alias Elibrary.Comments.Entities.Comment
  alias Elibrary.Tops.Entities.Top
  alias Elibrary.Relations.BookTag
  # alias Elibrary.Tops

  @required [
    :title,
    :ISBN,
    :author,
    :publisher,
    :thematics
  ]

  @optional [
    :type,
    :language,
    :country,
    :creation_year,
    :date_of_publication,
    :top
  ]

  schema "books" do
    field :title, :string
    field :ISBN, :string
    field :type, :string
    field :author, :string
    field :publisher, :string
    field :language, :string
    field :country, :string
    field :creation_year, :integer
    field :thematics, :string
    field :date_of_publication, :date
    field :top, :float, virtual: true

    many_to_many :tags, Tag, join_through: BookTag, on_replace: :delete
    has_many :comments, Comment
    has_many :tops, Top

    timestamps()
  end

  def create_changeset(%__MODULE__{} = book, attrs) do
    book
    |> Repo.preload(:tags)
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> unique_constraint(:ISBN)
    # Set the association
    |> put_assoc(:tags, attrs.tags)
  end

  def update_changeset(%__MODULE__{} = book, attrs) do
    book
    |> Repo.preload(:tags)
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> unique_constraint(:ISBN)
    |> put_assoc(:tags, attrs.tags)
  end
end
