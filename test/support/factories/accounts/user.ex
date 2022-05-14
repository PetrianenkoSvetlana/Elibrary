defmodule Elibrary.Factories.Accounts.UserFactory do
  defmacro __using__(_opts) do
    quote do
      alias Faker.{Internet, Lorem, Person}
      alias Elibrary.Accounts.Entities.User

      def user_factory(attrs) do
        password = Map.get(attrs, :password, Lorem.sentence(8..16))

        email = Map.get(attrs, :email, Internet.email())

        %User{
          password: password,
          email: sequence(:email, &"#{&1}_#{email}")
        }
      end
    end
  end
end
