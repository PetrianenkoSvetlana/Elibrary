defmodule Elibrary.Factories.Comments.CommentFactory do
  defmacro __using__(_opts) do
    quote do
      alias Elibrary.Comments.Entities.Comment
      alias Faker.{Lorem, DateTime}

      def comment_factory(attrs) do
        inserted_at = Map.get(attrs, :inserted_at, DateTime.forward(10))
        user = Map.get(attrs, :user, insert(:user))
        book = Map.get(attrs, :book, insert(:book))
        comment = Map.get(attrs, :comment, Lorem.sentence())

        %Comment{
          inserted_at: inserted_at,
          comment: comment,
          book: book,
          user: user
        }
      end
    end
  end
end
