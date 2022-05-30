defmodule Elibrary.Repo.Migrations.CreateBooksTags do
  use Ecto.Migration

  def change do
    create table(:books_tags) do
      add :book_id, references(:books)
      add :tag_id, references(:tags)

      timestamps()
    end

    create unique_index(:books_tags, [:book_id, :tag_id])
  end
end
