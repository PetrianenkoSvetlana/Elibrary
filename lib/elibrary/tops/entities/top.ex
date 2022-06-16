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
    |> evaluation_determinant()
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

  defp evaluation_determinant(
         %{valid?: true, changes: %{book_id: _book_id, comment_id: _comment_id}} = changeset
       ),
       do: add_error(changeset, [:book_id, :comment_id], "Both fields are filled in")

  defp evaluation_determinant(%{valid?: true, changes: %{book_id: _book_id}} = changeset),
    do: changeset

  defp evaluation_determinant(%{valid?: true, changes: %{comment_id: _comment_id}} = changeset),
    do: changeset

  defp evaluation_determinant(changeset),
    do: add_error(changeset, [:book_id, :comment_id], "Both fields are empty")
end
