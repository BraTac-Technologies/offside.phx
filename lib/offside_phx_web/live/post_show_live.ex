defmodule OffsidePhxWeb.PostShowLive do
  use OffsidePhxWeb, :live_view

  alias OffsidePhx.Repo
  alias OffsidePhxWeb.PostView
  alias OffsidePhx.Posts
  alias OffsidePhx.Tags
  alias OffsidePhx.Comments
  alias OffsidePhx.Comments.Comment

  def render(assigns) do
   render PostView, "show.html", assigns
  end

  def mount(params, _, socket) do
    post = Posts.get_post!(params["id"]) |> Repo.preload(:tag)
    last3_posts = Posts.get_last_3_posts()
    changeset = Comments.change_comment(%Comment{})
    comments = Comments.list_comments_by_post(post)
    socket = assign(
        socket,
        post: post,
        last3_posts: last3_posts,
        comments: comments,
        changeset: changeset
      )

    {:ok, socket, temporary_assigns: [comments: []]}
  end

  def handle_event("create_comment", %{"comment" => attrs}, socket) do
    post = Posts.get_post!(attrs["post_id"])

    case Comments.create_comment(attrs) do
      {:ok, comment} ->
        socket =
          update(
          socket,
          :comments,
          fn comments -> [ comment | comments ] end
          )

        changeset = Comments.change_comment(%Comment{})
        socket = put_flash(socket, :success, "Comment added successfully!")
        socket = assign(socket, changeset: changeset)

        {:noreply, socket}

      {:error, %Ecto.Changeset{} = changeset} ->

        socket = assign(socket, changeset: changeset)
        {:noreply, socket}
      end
  end


end
