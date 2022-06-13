defmodule Elibrary.Comments.Entities.Comment do
  use Ecto.Schema

  import Ecto.Changeset

  alias Elibrary.Accounts.Entities.User
  alias Elibrary.Books.Entities.Book
  alias Elibrary.Tops.Entities.Top
  # alias Elibrary.Repo

  @required [
    :comment,
    :book_id,
    :user_id
  ]

  @optional [
    :top
  ]

  schema "comments" do
    field :comment, :string
    field :top, :float, virtual: true

    belongs_to :book, Book
    belongs_to :user, User

    has_many :tops, Top

    timestamps()
  end

  def create_changeset(%__MODULE__{} = comment, attrs) do
    comment
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> assoc_constraint(:user)
  end

  def update_changeset(%__MODULE__{} = comment, attrs) do
    comment
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> assoc_constraint(:user)
  end
end
