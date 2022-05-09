defmodule Elibrary.Accounts.Entities.User do
  use Ecto.Schema

  import Ecto.Changeset
  # Обязательные поля
  @required [:email, :password]
  # Отображаем данные из таблицы users
  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :name, :string
    field :surname, :string
    field :patronymic, :string
    field :birthday, :date
    field :country, :string
    field :city, :string

    timestamps()
  end

  def create_changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:email)
    |> validate_format(:password, ~r/^(?=.*\d)(?=.*[a-z])(?=.*[a-zA-Z]).{8,}/,
    message: "invalid_format")
    # |> put_password_hash()
    |> validate_format(:email, ~r/^((([0-9A-Za-z]{1}[-0-9A-z\.]{1,}[0-9A-Za-z]{1})|([0-9А-Яа-я]{1}[-0-9А-я\.]{1,}[0-9А-Яа-я]{1}))@([-A-Za-z]{1,}\.){1,2}[-A-Za-z]{2,})$/u,
    message: "invalid_format")
  end

  def update_changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:email)
    |> validate_format(:password, ~r/^(?=.*\d)(?=.*[a-z])(?=.*[a-zA-Z]).{8,}/,
    message: "invalid_format")
    # |> put_password_hash()
    |> validate_format(:email, ~r/^((([0-9A-Za-z]{1}[-0-9A-z\.]{1,}[0-9A-Za-z]{1})|([0-9А-Яа-я]{1}[-0-9А-я\.]{1,}[0-9А-Яа-я]{1}))@([-A-Za-z]{1,}\.){1,2}[-A-Za-z]{2,})$/u,
    message: "invalid_format")
  end

  # defp put_password_hash(%{valid?: true, changes: %{password: password}} = changeset) do
  #   change(changeset, Argon2.add_hash(password))
  # end

  # defp put_password_hash(changeset), do: changeset
end
