defmodule OffsidePhxWeb.PostController do
  use OffsidePhxWeb, :controller

  alias OffsidePhx.Posts
  alias OffsidePhx.Posts.Post
  alias OffsidePhx.Tags
  alias OffsidePhx.Repo

  def index(conn, _params) do
    posts = Posts.list_posts()
    tags = Tags.list_tags()
    render(conn, "index.html", posts: posts, tags: tags)
  end

  def new(conn, _params) do
    changeset = Posts.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case Posts.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Posts.get_post!(id) |> Repo.preload(:tag)
    last3_posts = Posts.get_last_3_posts()
    render(conn, "show.html", post: post, last3_posts: last3_posts)
  end

  def edit(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    tags = Tags.list_tags()
    changeset = Posts.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset, tags: tags)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Posts.get_post!(id)

    case Posts.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    {:ok, _post} = Posts.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: Routes.post_path(conn, :index))
  end
end
