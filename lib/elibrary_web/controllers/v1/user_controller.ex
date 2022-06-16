defmodule ElibraryWeb.V1.UserController do
  use ElibraryWeb, :controller

  alias Elibrary.Accounts
  alias Elibrary.Accounts.Auth
  alias ElibraryWeb.ApplyParams
  # alias ElibraryWeb.ErrorView

  action_fallback(ElibraryWeb.FallbackController)

  defmodule CreateUSerParams do
    use Params.Schema, %{
      email!: :string,
      password!: :string,
      name: :string,
      surname: :string,
      patronymic: :string,
      birthday: :date,
      country: :string,
      city: :string
    }
  end

  defmodule UpdateUserParams do
    use Params.Schema, %{
      email: :string,
      password: :string,
      name: :string,
      surname: :string,
      patronymic: :string,
      birthday: :date,
      country: :string,
      city: :string
    }
  end

  def create(conn, attrs) do
    with {:ok, attrs} <- ApplyParams.do_apply(CreateUSerParams, attrs),
         {:ok, user} <- Accounts.create_user(attrs),
         {:ok, access_token, refresh_token} <- Auth.sign_user(user) do
      conn
      |> put_status(:created)
      |> render("create.json", %{
        user: user,
        access_token: access_token,
        refresh_token: refresh_token
      })
    end
  end

  def update(conn, %{"current_user" => current_user} = param) do
    with {:ok, attrs} <- ApplyParams.do_apply(UpdateUserParams, param),
         {:ok, user} <- Accounts.update_user(current_user, attrs) do
      render(conn, "update.json", %{user: user})
    end
  end
end
