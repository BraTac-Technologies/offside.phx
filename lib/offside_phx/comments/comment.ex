defmodule OffsidePhx.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias OffsidePhx.Posts.Post

  schema "comments" do
    field :author, :string
    belongs_to :post, Tag
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:post_id, :author, :text])
    |> validate_required([:author, :text])
  end
end
