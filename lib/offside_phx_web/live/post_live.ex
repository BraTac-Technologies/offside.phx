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
    posts = Posts.list_posts() |> Repo.preload(:tag)
    tags = Tags.list_tags()
    socket = assign(
        socket,
        posts: posts,
        tags: tags
      )
    socket =
      socket
      |> assign(limit: 8)
      |> load_posts_more()

    {:ok, socket, temporary_assigns: [posts_more: []]}
  end

  defp load_posts_more(socket) do
    assign(
    socket,
    posts_more:
      Posts.list_posts_more(socket.assigns.limit)
      )
  end

  def handle_event("load-more", _, socket) do
    socket =
      socket
      |> update(:limit, &(&1 + 6))
      |> load_posts_more

    {:noreply, socket}
  end



end
