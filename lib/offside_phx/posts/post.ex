defmodule OffsidePhx.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  use Waffle.Ecto.Schema

  alias OffsidePhx.Tags.Tag

  schema "posts" do
    field :info, :string
    field :text, :string
    field :title, :string
    field :banner, OffsidePhx.BannerUploader.Type

    belongs_to :tag, Tag

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :info, :text, :tag_id])
    |> cast_attachments(attrs, [:banner])
    |> validate_required([:title, :info, :text])
  end

end
