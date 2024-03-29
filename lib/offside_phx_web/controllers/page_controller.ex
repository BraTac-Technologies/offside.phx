defmodule OffsidePhxWeb.PageController do
  use OffsidePhxWeb, :controller

  alias OffsidePhx.Posts
  alias OffsidePhx.Tags
  alias OffsidePhx.Comments
  alias OffsidePhx.Repo
  #tags

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def admin(conn, _params) do
    posts = Posts.list_posts_default() |> Repo.preload(:tag)
    comments = Comments.list_comments()
    tags = Tags.list_tags()
    # tags
    render(conn, "admin.html", posts: posts, tags: tags, comments: comments)
  end
end
