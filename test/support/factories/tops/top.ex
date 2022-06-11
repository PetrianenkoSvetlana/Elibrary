defmodule Elibrary.Factories.Tops.TopFactory do
  defmacro __using__(_opts) do
    quote do
      # alias Faker.Random
      alias Elibrary.Tops.Entities.Top
      alias Elibrary.DataCase

      def top_factory(attrs) do
        estimation = Map.get(attrs, :estimation, Enum.random(1..5))
        user = Map.get(attrs, :user_id, insert(:user))
        book = Map.get(attrs, :book_id, insert(:book))
        comment = Map.get(attrs, :comment_id, insert(:comment))

        %Top{
          estimation: estimation,
          user: user,
          book: book,
          comment: comment
        }
      end
    end
  end
end
