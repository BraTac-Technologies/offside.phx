defmodule OffsidePhxWeb.PageController do
  use OffsidePhxWeb, :controller

  alias OffsidePhx.Posts
  #tags

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def admin(conn, _params) do
    posts = Posts.list_posts()
    # tags
    render(conn, "admin.html", posts: posts)
  end
end
