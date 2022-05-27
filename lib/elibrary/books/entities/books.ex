defmodule Elibrary.Books.Entities.Book do
  use Ecto.Schema

  import Ecto.Changeset

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
    :date_of_publication
  ]

  schema "books" do
    field :title, :string
    field :ISBN, :string
    field :type, :string
    field :author, :string
    field :publisher, :string
    field :language, :string
    field :country, :string
    field :thematics, :string
    field :date_of_publication, :date

    timestamps()
  end

  def create_changeset(%__MODULE__{} = book, attrs) do
    book
    |> cast(attrs, @required++@optional)
    |> validate_required(@required)
    |> unique_constraint(:ISBN)
  end

  def update_changeset(%__MODULE__{} = book, attrs) do
    book
    |> cast(attrs, @required++@optional)
    |> validate_required(@required)
    |> unique_constraint(:ISBN)
  end
end
