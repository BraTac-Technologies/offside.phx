defmodule OffsidePhx.Repo.Migrations.AddTagIdInPosts do
  use Ecto.Migration

  def change do
    alter table("posts") do
      add(:tag_id, references(:tags, on_delete: :delete_all))
    end
  end
end
