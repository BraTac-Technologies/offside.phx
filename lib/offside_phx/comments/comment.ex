defmodule OffsidePhx.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :author, :string
    field :posts, :string
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:posts, :author, :text])
    |> validate_required([:posts, :author, :text])
  end
end
