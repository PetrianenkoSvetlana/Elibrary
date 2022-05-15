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
    |> validate_format(:ISBN, ~r/^(?:ISBN(?:-1[03])?:? )?(?=[-0-9 ]{17}$|[-0-9X ]{13}$|[0-9X]{10}$)(?:97[89][- ]?)?[0-9]{1,5}[- ]?(?:[0-9]+[- ]?){2}[0-9X]$/, message: "invalid_format")
  end

  def update_changeset(%__MODULE__{} = book, attrs) do
    book
    |> cast(attrs, @required++@optional)
    |> validate_required(@required)
    |> unique_constraint(:ISBN)
    |> validate_format(:ISBN, ~r/^(?:ISBN(?:-1[03])?:? )?(?=[-0-9 ]{17}$|[-0-9X ]{13}$|[0-9X]{10}$)(?:97[89][- ]?)?[0-9]{1,5}[- ]?(?:[0-9]+[- ]?){2}[0-9X]$/, message: "invalid_format")
  end
end
