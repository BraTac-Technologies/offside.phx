defmodule OffsidePhx.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OffsidePhx.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        info: "some info",
        text: "some text",
        title: "some title"
      })
      |> OffsidePhx.Posts.create_post()

    post
  end
end
