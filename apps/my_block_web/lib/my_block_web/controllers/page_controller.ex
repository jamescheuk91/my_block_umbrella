defmodule MyBlockWeb.PageController do
  use MyBlockWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
