defmodule OffsidePhxWeb.PageController do
  use OffsidePhxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
