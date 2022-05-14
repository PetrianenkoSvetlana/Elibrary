defmodule Elibrary.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :password_hash, :string
      add :name, :string
      add :surname, :string
      add :patronymic, :string
      add :birthday, :date
      add :country, :string
      add :city, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
