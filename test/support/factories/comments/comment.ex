defmodule Elibrary.Factories.Comments.CommentFactory do
  defmacro __using__(_opts) do
    quote do
      alias Elibrary.Comments.Entities.Comment
      alias Faker.Lorem

      def comment_factory(attrs) do
        user = Map.get(attrs, :user, insert(:user))
        book = Map.get(attrs, :book, insert(:book))
        comment = Map.get(attrs, :comment, Lorem.sentence())
        email = user.email

        %Comment{
          comment: comment,
          email: email,
          book: book,
          user: user
        }
      end
    end
  end
end
