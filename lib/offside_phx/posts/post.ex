defmodule OffsidePhx.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :info, :string
    field :text, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :info, :text])
    |> validate_required([:title, :info, :text])
  end
end
