defmodule OffsidePhx.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add(:post_id, references(:posts, on_delete: :delete_all))
      add :author, :string
      add :text, :string

      timestamps()
    end
  end
end
