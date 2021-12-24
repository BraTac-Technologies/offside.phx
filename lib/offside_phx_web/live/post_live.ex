defmodule OffsidePhxWeb.PostLive do
  use OffsidePhxWeb, :live_view

  alias OffsidePhx.Repo
  alias OffsidePhxWeb.PostView
  alias OffsidePhx.Posts
  alias OffsidePhx.Tags

  def render(assigns) do
   render PostView, "index.html", assigns
  end

  def mount(params, _, socket) do
    posts = Posts.list_posts()
    tags = Tags.list_tags()
    socket = assign(
        socket,
        posts: posts,
        tags: tags,
      )
    {:ok, socket}
  end


end
