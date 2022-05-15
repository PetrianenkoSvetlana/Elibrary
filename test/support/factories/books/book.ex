defmodule Elibrary.Factories.Books.BookFactory do
  defmacro __using__(_opts) do
    quote do
      alias Elibrary.Books.Entities.Book
      alias Faker.{Internet, Lorem}
      alias ISBN

      def book_factory(attrs) do
        title = Map.get(attrs, :title, Lorem.word)
        ISBN = Map.get(attrs, :ISBN, ISBN)
        author = Map.get(attrs, :author, Lorem.word)
        publisher = Map.get(attrs, :publisher, Lorem.word)
        thematics = Map.get(attrs, :thematics, Lorem.word)

        %Book{
          title: title,
          ISBN: ISBN,
          author: author,
          publisher: publisher,
          thematics: thematics
        }
      end
    end
  end
end
