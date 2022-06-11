defmodule Elibrary.Repo.Migrations.CreateTop do
  use Ecto.Migration

  def change do
    create table(:top) do
      add :estimation, :integer, null: false
      add :user_id, references(:users)
      add :book_id, references(:books)
      add :comment_id, references(:comments)

      timestamps()
    end

    create unique_index(:top, [:user_id, :book_id, :comment_id])
  end
end
