defmodule Elibrary.Factories.Comments.CommentFactory do
  defmacro __using__(_opts) do
    quote do
      alias Elibrary.Comments.Entities.Comment
      alias Faker.Lorem

      def comment_factory(attrs) do
        user = 
        comment = Map.get(attrs, :comment, Lorem.word())
        email = Map.get(attrs, :email, insert(:user).email)

      end
    end
  end
end
