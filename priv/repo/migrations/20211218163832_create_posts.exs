defmodule OffsidePhx.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :info, :string
      add :text, :string

      timestamps()
    end
  end
end
