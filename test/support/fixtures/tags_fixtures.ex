defmodule OffsidePhx.TagsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OffsidePhx.Tags` context.
  """

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> OffsidePhx.Tags.create_tag()

    tag
  end
end
