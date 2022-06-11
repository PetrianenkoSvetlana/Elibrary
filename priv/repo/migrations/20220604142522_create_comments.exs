defmodule Elibrary.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :comment, :string, nill: false
      add :email, :string, nill: false
      add :user_id, references(:users)
      add :book_id, references(:books)

      timestamps()
    end

    create unique_index(:comments, [:email])
  end
end
