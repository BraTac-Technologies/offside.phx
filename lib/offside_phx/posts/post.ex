defmodule OffsidePhx.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias OffsidePhx.Tags.Tag

  schema "posts" do
    field :info, :string
    field :text, :string
    field :title, :string

    belongs_to :tag, Tag

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :info, :text, :tag_id])
    |> validate_required([:title, :info, :text])
  end
end
