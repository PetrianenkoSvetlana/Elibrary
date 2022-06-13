defmodule Elibrary.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string, null: false
      add :ISBN, :string, null: false
      add :type, :string
      add :author, :string, null: false
      add :publisher, :string, null: false
      add :language, :string
      add :country, :string
      add :creation_year, :integer
      add :thematics, :string, null: false
      add :date_of_publication, :date

      timestamps()
    end

    create unique_index(:books, [:ISBN])
  end
end
