defmodule Elibrary.Comments.Entities.Comment do
  use Ecto.Schema

  import Ecto.Changeset

  alias Elibrary.Accounts.Entities.User
  alias Elibrary.Books.Entities.Book
  # alias Elibrary.Repo

  @required [
    :comment,
    :email,
    :book_id,
    :user_id
  ]

  schema "comments" do
    field :comment, :string
    field :email, :string

    belongs_to :book, Book
    belongs_to :user, User

    timestamps()
  end

  def create_changeset(%__MODULE__{} = comment, attrs) do
    comment
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> assoc_constraint(:user)
    |> unique_constraint(:email)
  end

  def update_changeset(%__MODULE__{} = comment, attrs) do
    comment
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> assoc_constraint(:user)
    |> unique_constraint(:email)
  end

end
