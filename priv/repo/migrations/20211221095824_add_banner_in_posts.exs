defmodule OffsidePhx.Repo.Migrations.AddBannerInPosts do
  use Ecto.Migration

  def change do
    alter table("posts") do
      add :banner, :string
    end
  end
end
