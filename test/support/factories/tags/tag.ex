defmodule Elibrary.Factories.Tags.TagFactory do
  defmacro __using__(_opts) do
    quote do
      alias Elibrary.Tags.Entities.Tag
      alias Faker.Lorem

      def tag_factory(attrs) do
        tag = Map.get(attrs, :tag, Lorem.word())

        %Tag{
          tag: sequence(:tag, &"#{&1}_#{tag}")
        }
      end
    end
  end
end
