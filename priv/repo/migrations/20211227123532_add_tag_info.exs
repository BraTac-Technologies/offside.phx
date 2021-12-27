defmodule OffsidePhx.Repo.Migrations.AddTagInfo do
  use Ecto.Migration

  def change do
    alter table(:tags) do
      add :info, :string
    end
  end
end
