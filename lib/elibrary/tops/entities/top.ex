defmodule Elibrary.Tops.Entities.Top do
  use Ecto.Schema

  import Ecto.Changeset

  alias Elibrary.{
    Accounts.Entities.User,
    Books.Entities.Book,
    Comments.Entities.Comment
  }

  @required [
    :estimation,
    :user_id
  ]

  @options [
    :book_id,
    :comment_id
  ]

  schema "top" do
    field :estimation, :integer

    belongs_to :user, User
    belongs_to :book, Book
    belongs_to :comment, Comment

    timestamps()
  end

  def create_changeset(%__MODULE__{} = top, attrs) do
    top
    |> cast(attrs, @required ++ @options)
    |> validate_required(@required)
    |> validate_number(:estimation, less_than_or_equal_to: 5, greater_than_or_equal_to: 1)
    |> assoc_constraint(:user)
    |> assoc_constraint(:book)
    |> assoc_constraint(:comment)

    # |> unique_constraint([:user_id, :book_id, :comment_id])
  end

  def update_changeset(%__MODULE__{} = top, attrs) do
    top
    |> cast(attrs, @required ++ @options)
    |> validate_required(@required)
    |> validate_number(:estimation, less_than_or_equal_to: 5, greater_than_or_equal_to: 1)
    |> assoc_constraint(:user)
    |> assoc_constraint(:book)
    |> assoc_constraint(:comment)
  end
end
