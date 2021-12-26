defmodule OffsidePhx.Repo.Migrations.ConvertTypeOfTextInPost do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      modify :text, :text
    end
  end
end
