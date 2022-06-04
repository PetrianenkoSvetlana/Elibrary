defmodule Elibrary.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :comment, :string, nill: false
      add :email, :string, nill: false
      add :user_id, references(:user)
      add :book_id, references(:book)
      
      timestamps()
    end

    create unique_index(:comments, [:email])
  end
end
